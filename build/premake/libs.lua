     
-- lua library
project "lua-5.3.5"
   language "C"
   kind "StaticLib"
   -- destination directory for compiled binary target
   targetdir(LibPath)
   files {
      "../../lua-5.3.5/src/**.h",
      "../../lua-5.3.5/src/**.hpp",
      "../../lua-5.3.5/src/**.c"
   }
   excludes {
      "../../lua-5.3.5/src/lua.c",
      "../../lua-5.3.5/src/luac.c"
   }
   if os.ishost("linux") then
      defines { "LUA_COMPAT_MODULE_5_2", "LUA_USE_LINUX" }
   end
   targetname "lua"

