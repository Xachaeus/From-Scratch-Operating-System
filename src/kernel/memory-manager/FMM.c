
#include <stdint.h>
#include "FMM.h"
#include "PMM.h"

uint64_t FMM_Initialize(AddressRangeDescriptor* mem) {
    return PMM_Initialize(mem);
}