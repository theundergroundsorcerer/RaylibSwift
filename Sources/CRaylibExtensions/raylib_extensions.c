#include "include/raylib_extensions.h"
#include <stdarg.h>
#include <stdio.h>

#if __has_include(<raylib.h>)
#include <raylib.h>
#elif __has_include("/opt/homebrew/include/raylib.h")
#include "/opt/homebrew/include/raylib.h"
#elif __has_include("/usr/local/include/raylib.h")
#include "/usr/local/include/raylib.h"
#else
#error "raylib.h not found. Please install raylib with Homebrew."
#endif

static TraceLogCallBackSwift currentSwiftCallback = NULL;

void TraceLogSwift(int logLevel, const char *message)
{
    TraceLog(logLevel, "%s", message);
}

void CurrentCallbackWrapper(int logLevel, const char *text, va_list args)
{
    char buffer[4096];
    vsnprintf(buffer, sizeof(buffer), text, args);

    if (currentSwiftCallback)
    {
        currentSwiftCallback(logLevel, buffer);
    }
    else
    {
        TraceLogSwift(logLevel, buffer);
    }
}

void SetTraceLogCallbackSwift(TraceLogCallBackSwift callback)
{
    currentSwiftCallback = callback;

    if (callback == NULL)
    {
        SetTraceLogCallback(NULL);
    }
    else
    {
        SetTraceLogCallback(CurrentCallbackWrapper);
    }
}