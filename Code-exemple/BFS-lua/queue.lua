-- This module implements a Queue class that behave like a queue
-- inspired from the book « Programming in Lua » https://www.lua.org/pil/11.4.html

Object = require 'classic' -- module to manage classes/objects in Lua

Queue = Object:extend() -- create a Queue class

function Queue:new() -- Queue class constructor
  self.first = 0
  self.last = -1
  self.data = {} 
  self.empty = true
end

function Queue:enqueue(value) -- enqueue method
    self.last = self.last + 1
    self.data[self.last] = value
    self.empty = false
end

function Queue:dequeue() -- dequeue method
    local value
    if self.first > self.last then
        error('list is empty')
    else
        value = self.data[self.first]
        self.data[self.first] = nil
        self.first = self.first + 1
        if self.first > self.last then
            self.empty = true
        end
    end
    return value
end

function Queue:print_elements()
    for i = 0, #queue.data do
        print(queue.data[i])
    end
end


--[[test 
queue = Queue()
print('enqueue A')
queue:enqueue('A')
print('enqueue B')
queue:enqueue('B')
print('enqueue C')
queue:enqueue('C')

queue:print_elements()

print('queue.first', queue.first)
print('queue.last', queue.last)
print('queue empty', queue.empty)


repeat
    local x = queue.data[queue.first]
    print('dequeue ', x)
    print(queue:dequeue(), 'dequeued')
until (queue.first > queue.last)
print('queue.first', queue.first)
print('queue.last', queue.last)
print('queue empty', queue.empty)


queue:print_elements()

queue:enqueue('A')
print(queue.data[queue.first])
print(queue.data[queue.last])
print(#queue.data)
print('queue empty', queue.empty)


queue:dequeue()
print(queue.data[queue.first])
print(queue.data[queue.last])
print(#queue.data)
print('queue.first', queue.first)
print('queue.last', queue.last)
print('queue empty', queue.empty)
--]]

return Queue 