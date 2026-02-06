#include "CLI.h"
#include <memory.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <filesys/fat12.h>
#include <proc/load.h>
#include <proc/proc.h>
#include <hardware-io/io.h>
#include <delay.h>

#define ERROR_ID 0xFFFFFFFF
#define LS_ID 0
#define CD_ID 1
#define CAT_ID 2
#define EXEC_ID 3
#define PS_ID 4
#define MEM_ID 5

CMDHandler g_CMDHandlers[256];
char CurrentPath[256];



int GetCMD(const char* command) {
    int command_len = strlen(command);
    switch (command_len) {
        case 2:
            if (memcmp(command, "ls", 2) == 0) {return LS_ID;}
            else if (memcmp(command, "cd", 2) == 0) {return CD_ID;}
            else if (memcmp(command, "ps", 2) == 0) {return PS_ID;}
            break;
        case 3:
            if (memcmp(command, "cat", 3) == 0) {return CAT_ID;}
            if (memcmp(command, "mem", 3) == 0) {return MEM_ID;}
            break;
        case 4:
            if (memcmp(command, "exec", 4) == 0) {return EXEC_ID;}
            break;
        default:
            return ERROR_ID;
    }
    return ERROR_ID;
}


void RegisterCMDHandler(int id, CMDHandler handler) {
    g_CMDHandlers[id] = handler;
}




void EXEC(int argc, const char** argv) {
    if (argc > 1) {
        const char* new_path = argv[1];
        char absolute_path[256];
        if (new_path[0] != '/') { // Relative, non-absolute path
            strcpy(absolute_path, CurrentPath);
            absolute_path[strlen(CurrentPath)] = '/';
            strcpy(absolute_path+strlen(CurrentPath)+1, new_path);
        }
        else {
            strcpy(absolute_path, new_path);
        }
        int pid = GetAvailablePID();
        if (!LoadProc(absolute_path, GetPCB(pid))) {printf("Error: exe file not found!\n"); return;}

        MaskTimerInterrupt();
        DisableScheduling();
        const char* argv_default[] = {absolute_path};
        ExecProc(pid, 1, argv_default);
        ProcessControlBlock* proc = GetPCB(pid);
        if (argc >= 3) {
            if (argv[2][0] == '&') {
                EnableScheduling();
                UnmaskTimerInterrupt();
                return;
            }
            else if (argv[2][0] == '-') { // Flag handling
                switch (argv[2][1]) {

                    case 'm': // launch multiple processes
                        MaskTimerInterrupt();
                        DisableScheduling();
                        for (int i = 0; i < 4; i++) {
                        DisableScheduling();
                            pid = GetAvailablePID();
                            //printf("Launching proc %d\n", pid);
                            LoadProc(absolute_path, GetPCB(pid));
                            ExecProc(pid, 0, NULL);
                        }
                        EnableScheduling();
                        UnmaskTimerInterrupt();
                        return;

                    default:
                        printf("Error: unknown flag \"%c\"\n", argv[2][1]);
                }

            }
        }
        EnableScheduling();
        UnmaskTimerInterrupt();
        while (proc->proc_state != COMPLETE) {};
    }
}

void LS(int argc, const char** argv) {
    if (argc == 1) {
        FAT12_File* dir = FAT12_Open(CurrentPath);
        FAT12_DirectoryEntry entry;
        while (FAT12_ReadEntry(dir, &entry)) {
            if (entry.Name[0] == '\0'){break;}
            for (int i = 0; i<11; i++) {printf("%c", entry.Name[i]);}
            printf("\n");
        }
        FAT12_Close(dir);
    }
}

void CD(int argc, const char** argv) {
    const char* new_path = argv[1];
    char absolute_path[256];
    if (new_path[0] != '/') { // Relative, non-absolute path
        strcpy(absolute_path, CurrentPath);
        absolute_path[strlen(CurrentPath)] = '/';
        strcpy(absolute_path+strlen(CurrentPath)+1, new_path);
    }
    else {
        strcpy(absolute_path, new_path);
    }
    //printf("Searching for: \"%s\"\n", new_path);
    new_path = absolute_path;
    FAT12_File* file = FAT12_Open(new_path);
    if (file != NULL) {
        if (!file->IsDirectory) {
            printf("Error: %s not a directory\n", new_path);
        }
        else {
            //printf("Found directory: %s\n", new_path);
            if (new_path[0] == '/'){new_path++;}
            int new_path_len = strlen(new_path);
            // Fix the path if it uses a . or .. transition
            if (new_path[new_path_len-1] == '.') {
                // Case for ..
                if (new_path[new_path_len-2] == '.'){
                    int current_path_len = strlen(CurrentPath);
                    int count = 0;
                    for (int i = 0; i<current_path_len; i++) {
                        if (CurrentPath[i] == '/') {count++;}
                    }
                    int subcount = 0; 
                    for (int i = 0; i<current_path_len; i++) {
                        if (CurrentPath[i] == '/') {subcount++;}
                        if (subcount == count) {
                            CurrentPath[i] = '\0';
                            break;
                        }
                    }
                }
                return;
            }
            memcpy(CurrentPath, new_path, new_path_len);
            memset(CurrentPath + new_path_len, '\0', 256-new_path_len);
        }
        FAT12_Close(file);
    }
    else {
        printf("Error: no such directory %s\n", new_path);
    }
}

void CAT(int argc, const char** argv) {
    const char* file_path = argv[1];
    char absolute_path[256];
    if (file_path[0] != '/') { // Relative, non-absolute path
        strcpy(absolute_path, CurrentPath);
        absolute_path[strlen(CurrentPath)] = '/';
        strcpy(absolute_path+strlen(CurrentPath)+1, file_path);
    }
    else {
        strcpy(absolute_path, file_path);
    }
    FAT12_File* file = FAT12_Open(absolute_path);
    if (file != NULL) {
        if (file->IsDirectory)  {
            printf("Error: %s is a directory\n", absolute_path);
        }
        else {
            char print_buffer[513];
            while(file->Position != file->Size) {
                FAT12_Read(file, 512, print_buffer);
                print_buffer[((file->Position-1) % 512) + 1] = '\0';
                printf("%s", print_buffer);
            }
            printf("\n");
        }
        FAT12_Close(file);
    }
    else {
        printf("Error: no such file %s\n", absolute_path);
    }
}




void PS(int argc, const char** argv) {
    for (int i = 0; i<100; i++) {
        ProcessControlBlock* pcb = GetPCB(i);
        if (pcb->proc_state != COMPLETE) {
            printf("%d: %s\n", i, ((pcb->proc_state==RUNNING || pcb->proc_state==READY) ? "RUNNING" : "BLOCKED"));
        }
    }
}


void MEM(int argc, const char** argv) {
    uint32_t count = FMM_GetUsedMemory();
    printf("%d blocks (%lld bytes) currently in use\n", count, ((uint64_t)count)*4096);
}




int CLI_Mainloop() {

    for (int i = 0; i<256; i++) {
        RegisterCMDHandler(i, NULL);
    }

    RegisterCMDHandler(LS_ID, LS);
    RegisterCMDHandler(CD_ID, CD);
    RegisterCMDHandler(CAT_ID, CAT);
    RegisterCMDHandler(EXEC_ID, EXEC);
    RegisterCMDHandler(PS_ID, PS);
    RegisterCMDHandler(MEM_ID, MEM);

    char DriveLetter = 'A';
    char CommandBuffer[256];
    const char* ARGV_Base[256];

    memset(CurrentPath, '\0', 256);

    while(true) {

        memset(CommandBuffer, '\0', 256);
        for (int i = 0; i<256; i++) {
            ARGV_Base[i] = NULL;
        }

        printf("user@machine::%c:/%s$ ", DriveLetter, CurrentPath);
        getline(CommandBuffer, 256);

        int command_len = strlen(CommandBuffer);
        int argc = 0;
        bool inArg = false;

        if (command_len == 0) {continue;}

        for (int i = 0; i < command_len; i++) {
            // Case 1: Found a value while not already in a value
            if (CommandBuffer[i] != ' ' && !inArg) {
                inArg = true; ARGV_Base[argc] = &(CommandBuffer[i]); argc++;
            }
            // Case 2: Found the end of a value
            else if (CommandBuffer[i] == ' ' && inArg) {
                inArg = false; CommandBuffer[i] = '\0';
            }
            // Case 3: Found a space but not ending the current value
            // Case 4: Found a value while already in value
            // For both of these situations, no changes need to be made
        }

        int cmd_id =  GetCMD(ARGV_Base[0]);
        if (cmd_id == ERROR_ID) {
            printf("Error: unknown command: %s\n", ARGV_Base[0]);
        }
        else if (g_CMDHandlers[cmd_id] == NULL) {
            printf("Error: unhandled command: %s\n", ARGV_Base[0]);
        }
        else {
            g_CMDHandlers[cmd_id](argc, ARGV_Base);
        }
    }
}

