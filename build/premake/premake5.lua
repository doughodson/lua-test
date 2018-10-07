--
-- If premake command is not supplied an action (target compiler), exit!
--
-- Target of interest:
--     vs2017     (Visual Studio 2017)
--     gmake      (Linux gcc / clang)
--

-- we must have an ide/compiler specified
if (_ACTION == nil) then
  return
end

-- lua headers
IncPath_lua       = "../../lua-5.3.5/src"
-- sol2 headers
IncPath_sol2      = "../../sol2/include"

-- location of compiled libraries
LibPath       = "../../lib"

workspace "lua-test"

   -- destination directory for generated solution/project files
   location ("../" .. _ACTION)

   -- default C++ code in projects
   language "C++"

   --
   -- Build (solution) configuration options:
   --     Release        (Application linked to Multi-threaded DLL)
   --     Debug          (Application linked to Multi-threaded Debug DLL)
   --
   configurations { "Release", "Debug" }

   -- common release configuration flags and symbols
   filter { "Release" }
      optimize "On"
      -- enable compiler intrinsics and favour speed over size
      if _ACTION ~= "gmake" then
         buildoptions { "/Oi", "/Ot" }
         defines { "WIN32", "NDEBUG" }
      end

   -- common debug configuration flags and symbols
   filter { "Debug" }
      symbols "On"
      targetsuffix "_d"
      -- enable compiler intrinsics
      if _ACTION ~= "gmake" then
         buildoptions { "/Oi" }
         defines { "WIN32", "_DEBUG" }
      end

   -- libs
   dofile "libs.lua"

   -- examples
   dofile "examples.lua"
   dofile "examples-sol2.lua"

