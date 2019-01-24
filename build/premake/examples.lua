
--------------------------------------------------------
-- examples
--------------------------------------------------------

-- application with 'built-in' lua-based test capability
project "app1"
   kind "ConsoleApp"
   targetname "app1"
   targetdir "../../examples/app1"
   debugdir "../../examples/app1"
   files {
      "../../examples/app1/**.cpp",
      "../../examples/app1/**.c",
      "../../examples/app1/**.h"
   }
   includedirs { IncPathLua }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "liblua" }

-- stock lua compiler
project "luac"
   kind "ConsoleApp"
   targetname "luac"
   targetdir "../../examples/luac"
   debugdir "../../examples/luac"
   files {
      "../../examples/luac/**.c"
   }
   includedirs { IncPathLua }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "liblua" }

-- stock lua interpreter / read-eval-print-loop
project "lua"
   kind "ConsoleApp"
   targetname "lua"
   targetdir "../../examples/lua"
   debugdir "../../examples/lua"
   files {
      "../../examples/lua/**.c"
   }
   includedirs { IncPathLua }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "liblua" }

-- lua simple read-eval-print-loop
project "repl-simple"
   kind "ConsoleApp"
   targetname "repl"
   targetdir "../../examples/repl-simple"
   debugdir "../../examples/repl-simple"
   files {
      "../../examples/repl-simple/**.c",
      "../../examples/repl-simple/**.h"
   }
   includedirs { IncPathLua }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "liblua" }

-- lua stock read-eval-print-loop, extended with my own lib
project "repl-extend"
   kind "ConsoleApp"
   targetname "repl"
   targetdir "../../examples/repl-extend"
   debugdir "../../examples/repl-extend"
   files {
      "../../examples/repl-extend/**.cpp",
      "../../examples/repl-extend/**.c",
      "../../examples/repl-extend/**.h"
   }
   includedirs { IncPathLua }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "liblua" }

-- lua simple read-eval-print-loop - but compiled with C++
project "repl-cpp"
   kind "ConsoleApp"
   targetname "repl"
   targetdir "../../examples/repl-cpp"
   debugdir "../../examples/repl-cpp"
   files {
      "../../examples/repl-cpp/**.cpp",
      "../../examples/repl-cpp/**.c",
      "../../examples/repl-cpp/**.h"
   }
   includedirs { IncPathLua }
   libdirs     { LibPath }
   if os.ishost("linux") then
      links { "dl", "readline" }
   else
      defines { "_CONSOLE" }
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   end
   links { "liblua" }
