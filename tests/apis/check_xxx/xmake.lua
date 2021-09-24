includes("check_links.lua")
includes("check_ctypes.lua")
includes("check_cflags.lua")
includes("check_cfuncs.lua")
includes("check_features.lua")
includes("check_csnippets.lua")
includes("check_cincludes.lua")

target("test")
    set_kind("binary")
    add_files("*.c")
    add_includedirs("$(buildir)")
    add_configfiles("config.h.in")

    check_ctypes("HAS_WCHAR", "wchar_t")
    check_cincludes("HAS_STRING_H", "string.h")
    check_csnippets("HAS_INT_4", "return (sizeof(int) == 4)? 0 : -1;", {tryrun = true})
    check_csnippets("INT_SIZE", 'printf("%d", sizeof(int)); return 0;', {output = true, number = true})
    configvar_check_cincludes("HAS_STRING_AND_STDIO_H", {"string.h", "stdio.h"})
    configvar_check_ctypes("HAS_WCHAR_AND_FLOAT", {"wchar_t", "float"})
    configvar_check_links("HAS_PTHREAD", {"pthread", "m", "dl"})
    configvar_check_csnippets("HAS_STATIC_ASSERT", "_Static_assert(1, \"\");")
    configvar_check_cfuncs("HAS_SETJMP", "setjmp", {includes = {"signal.h", "setjmp.h"}})
    configvar_check_features("HAS_CONSTEXPR", "cxx_constexpr", {languages = "c++11"})
    configvar_check_features("HAS_CONSEXPR_AND_STATIC_ASSERT", {"cxx_constexpr", "c_static_assert"}, {languages = "c++11"})
    configvar_check_cflags("HAS_SSE2", "-msse2")
    configvar_check_csnippets("HAS_LONG_8", "return (sizeof(long) == 8)? 0 : -1;", {tryrun = true})
    configvar_check_csnippets("PTR_SIZE", 'printf("%d", sizeof(void*)); return 0;', {output = true, number = true})
    configvar_check_csnippets("HAVE_VISIBILITY", 'extern __attribute__((__visibility__("hidden"))) int hiddenvar;', {default = 0})
    configvar_check_csnippets("CUSTOM_ASSERT=assert", 'assert(1);', {default = "", quote = false})
