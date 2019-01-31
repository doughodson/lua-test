
print("Inside Lua land")

print("A with default constructor")
a1 = A.new()
print("A with int constructor")
a2 = A.new(10)

print(a1:getX())
print(a2:getX())

print("Setting a1 to nil")
a1 = nil
print("Setting a2 to nil")
a2 = nil

print("Local variable")
local a3 = A.new()
a3 = nil
collectgarbage("collect")
print("Local variable reassinged")

