Object = require 'classic' -- module to manage classes/objects in Lua

Stack = Object:extend() -- create Stack class

function Stack:new() -- Stack class constructor
    self.data = {}
    self.empty = true
end

function Stack:push(value)
    self.data[#self.data + 1] = value
    self.empty = false
end

function Stack:pop()
    if #self.data <= 0 then
        error('stack is empty')
    end
    local value = self.data[#self.data]
    self.data[#self.data] = nil
    if #self.data < 1 then
        self.empty = true
    end
    return value
end

function Stack:print_elements()
    for i = #self.data, 1, -1 do
        print(self.data[i])
    end
end

--[[ TEST

stack = Stack()
print('push A')
stack:push('A')
print('push B')
stack:push('B')
print('push C')
stack:push('C')

print('Elements pushed in stack:')
stack:print_elements()

print('pop last element:')
print(stack:pop())
print('pop last element:')
print(stack:pop())
print('pop last element:')
print(stack:pop())

print('Remaining elements in stack:')
stack:print_elements()
]]

return Stack