
--------------------------------------------------------
-- sol2-based examples
--------------------------------------------------------

-- first app using sol2 interfaces
project "sol2-app1"
   kind "ConsoleApp"
   targetname "sol2-app1"
   targetdir "../../examples/sol2-app1"
   debugdir "../../examples/sol2-app1"
   files {
      "../../examples/sol2-app1/**.cpp",
      "../../examples/sol2-app1/**.c",
      "../../examples/sol2-app1/**.h"
   }
   includedirs { LuaIncPath, Sol2IncPath }
   libdirs     { LuaLibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "lua-5.3.4" }

