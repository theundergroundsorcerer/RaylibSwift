// Try both common Homebrew paths
#if __has_include(<raylib.h>)
#include <raylib.h>
#elif __has_include("/opt/homebrew/include/raylib.h")
#include "/opt/homebrew/include/raylib.h"
#elif __has_include("/usr/local/include/raylib.h")
#include "/usr/local/include/raylib.h"
#else
#error "raylib.h not found. Please install raylib with Homebrew."
#endif
#include <stdarg.h>
#include "include/shim.h"
#include <stdio.h>


void TraceLogV(int logLevel, const char* format, va_list args) {
    char buffer[4096];
    vsnprintf(buffer, sizeof(buffer), format, args);
    TraceLog(logLevel, "%s", buffer);
    
}