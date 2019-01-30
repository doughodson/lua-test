
print("Lua here... creating a ship")
fwoosh = ship.new()
--
-- note the ":" that is there: this is mandatory for member function calls
-- ":" means "pass self" in Lua
--
local success = fwoosh:shoot()
local is_dead = fwoosh:hurt(20)
-- check if it works
print(is_dead)                         -- the ship is not dead at this point
print(fwoosh.life .. " life left")     -- 80 life left
print(fwoosh.bullet_count)             -- 19

print("Over and out")
