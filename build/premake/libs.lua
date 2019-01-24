     
-- lua library
project "liblua"
   language "C"
   kind "StaticLib"
   -- destination directory for compiled binary target
   targetdir(LibPath)
   files {
      "../../deps/src/lua-5.3.5/src/**.h",
      "../../deps/src/lua-5.3.5/src/**.hpp",
      "../../deps/src/lua-5.3.5/src/**.c"
   }
   excludes {
      "../../deps/src/lua-5.3.5/src/lua.c",
      "../../deps/src/lua-5.3.5/src/luac.c"
   }
   if os.ishost("linux") then
      defines { "LUA_COMPAT_MODULE_5_2", "LUA_USE_LINUX" }
   end
   targetname "lua"

