     
-- lua library
project "lua-5.3.4"
   kind "StaticLib"
   -- destination directory for compiled binary target
   targetdir(LuaLibPath)
   files {
      "../../lua-5.3.4/**.h",
      "../../lua-5.3.4/**.hpp",
      "../../lua-5.3.4/**.c"
   }
   excludes {
      "../../lua-5.3.4/lua.c",
      "../../lua-5.3.4/luac.c"
   }
   if os.ishost("linux") then
      defines { "LUA_COMPAT_MODULE_5_2", "LUA_USE_LINUX" }
   end
   targetname "lua"

