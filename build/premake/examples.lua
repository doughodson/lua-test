
--------------------------------------------------------
-- Lua apps
--------------------------------------------------------

-- stock lua compiler
project "luac"
   kind "ConsoleApp"
   targetname "luac"
   targetdir "../../examples/luac"
   debugdir "../../examples/luac"
   files {
      "../../examples/luac/**.c"
   }
   includedirs { "../../lua-5.3.4/src" }
   libdirs     { "../../lib" }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   filter "Release"
      links { "lua-5.3.4" }
   filter "Debug"
      links { "lua-5.3.4_d" }

-- stock lua interpreter / read-eval-print-loop
project "lua"
   kind "ConsoleApp"
   targetname "lua"
   targetdir "../../examples/lua"
   debugdir "../../examples/lua"
   files {
      "../../examples/lua/**.c"
   }
   includedirs { "../../lua-5.3.4/src" }
   libdirs     { "../../lib" }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE", }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   filter "Release"
      links { "lua-5.3.4" }
   filter "Debug"
      links { "lua-5.3.4_d" }

--[[
-- lua simple read-eval-print-loop
project "lua-repl-simple"
   kind "ConsoleApp"
   targetname "repl"
   targetdir "../../lua-repl-simple"
   debugdir "../../lua-repl-simple"
   files {
      "../../lua-repl-simple/**.c",
      "../../lua-repl-simple/**.h"
   }
   includedirs { Dep3RDPartyRoot .. "/src/lua-5.3.4" }
   libdirs     { Dep3rdPartyLibPath }
   defines { "_CONSOLE", }
   filter "Release32"
      links { "lua-5.3.4" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   filter "Debug32"
      links { "lua-5.3.4_d" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}

-- lua stock read-eval-print-loop, extended with my own lib
project "lua-repl-extend"
   kind "ConsoleApp"
   targetname "repl"
   targetdir "../../lua-repl-extend"
   debugdir "../../lua-repl-extend"
   files {
      "../../lua-repl-extend/**.cpp",
      "../../lua-repl-extend/**.c",
      "../../lua-repl-extend/**.h"
   }
   includedirs { Dep3RDPartyRoot .. "/src/lua-5.3.4" }
   libdirs     { Dep3rdPartyLibPath }
   defines { "_CONSOLE", "LUA_COMPAT_MODULE" }
   filter "Release32"
      links { "lua-5.3.4" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   filter "Debug32"
      links { "lua-5.3.4_d" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}

-- lua mylib C++ lib extension as a DLL
project "lua-mylib-dll"
   kind "SharedLib"
   targetname "mylib"
   targetdir "../../lua-mylib-dll"
   debugdir "../../lua-mylib-dll"
   files {
      "../../lua-mylib-dll/**.cpp",
      "../../lua-mylib-dll/**.c",
      "../../lua-mylib-dll/**.h"
   }
   targetsuffix ""
   libdirs     { "../../lua-mylib-dll/lualib" }
   defines { "_CONSOLE", "LUA_COMPAT_MODULE" }
   filter "Release32"
      links { "lua53" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   filter "Debug32"
      links { "lua53" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}

-- lua test to interact with C++ code
project "lua-test1"
   kind "ConsoleApp"
   targetname "repl"
   targetdir "../../lua-test1"
   debugdir "../../lua-test1"
   files {
      "../../lua-test1/**.cpp",
      "../../lua-test1/**.c",
      "../../lua-test1/**.h"
   }
   includedirs { Dep3RDPartyRoot .. "/src/lua-5.3.4" }
   libdirs     { Dep3rdPartyLibPath }
   defines { "_CONSOLE", "LUA_COMPAT_MODULE" }
   filter "Release32"
      links { "lua-5.3.4" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   filter "Debug32"
      links { "lua-5.3.4_d" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}

]]
