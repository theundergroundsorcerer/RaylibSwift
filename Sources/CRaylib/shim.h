#ifndef RAYLIB_SHIM_H
#define RAYLIB_SHIM_H

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

#endif 