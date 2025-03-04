
#include "shim.h"
#include <stdio.h>


void TraceLogV(int logLevel, const char* format, va_list args) {
    char buffer[4096];
    vsnprintf(buffer, sizeof(buffer), format, args);
    TraceLog(logLevel, "%s", buffer);
    
}