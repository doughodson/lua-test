
--------------------------------------------------------
-- sol2-based examples
--------------------------------------------------------

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
   includedirs { IncPathLua, IncPathSol2 }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "liblua" }
   if _ACTION == "gmake" then
      filter { "files:**.cpp" }
         buildoptions { "-std=c++14" }
   end
