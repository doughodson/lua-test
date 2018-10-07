
--------------------------------------------------------
-- sol2-based examples
--------------------------------------------------------

-- very basic sol2-based app
project "sol2-app1"
   kind "ConsoleApp"
   targetname "sol2-app1"
   targetdir "../../examples/sol2-app1"
   debugdir "../../examples/sol2-app1"
   files {
      "../../examples/sol2-app1/**.h**",
      "../../examples/sol2-app1/**.cpp",
      "../../examples/sol2-app1/**.c"
   }
   includedirs { IncPath_lua, IncPath_sol2 }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   if _ACTION == "gmake" then
      buildoptions { "-std=c++14" }
   end
   links { "lua-5.3.5" }

-- using sol2 to interface to C library
project "sol2-app2"
   kind "ConsoleApp"
   targetname "sol2-app2"
   targetdir "../../examples/sol2-app2"
   debugdir "../../examples/sol2-app2"
   files {
      "../../examples/sol2-app2/**.h**",
      "../../examples/sol2-app2/**.cpp",
      "../../examples/sol2-app2/**.c"
   }
   includedirs { IncPath_lua, IncPath_sol2 }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "lua-5.3.5" }
   if _ACTION == "gmake" then
      filter { "files:**.cpp" }
         buildoptions { "-std=c++14" }
   end
