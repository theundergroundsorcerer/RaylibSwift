#ifndef RAYLIB_EXTENSIONS_H
#define RAYLIB_EXTENSIONS_H

#include <stdarg.h>

typedef void (*TraceLogCallBackSwift)(int logLevel, const char* message);

void TraceLogSwift(int logLevel, const char* format);
void SetTraceLogCallbackSwift(TraceLogCallBackSwift callback);

#endif