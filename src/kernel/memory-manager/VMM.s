.intel_syntax noprefix
.align 4
.code32

.section .text

.global VMM_EnablePaging
VMM_EnablePaging:
    
    mov eax, [esp+4]
    mov cr3, eax        // Page directory now in cr3

    mov eax, cr0
    or eax, 0x80000001  // Set the "paging" and "protection" bit of cr0
    mov cr0, eax

    ret
