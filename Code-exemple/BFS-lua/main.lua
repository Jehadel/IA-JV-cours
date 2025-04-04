Queue = require "queue" -- module to manage queue
Object = require "classic" -- module to manage classes/objects in Lua

Node = Object:extend() -- create an Node class

function Node:new(name) -- Node class constructor
    self.name = name
    self.lst_neighbours = {}
    self.visited = false
end

function breadth_first_search(start)
    local queue = Queue()
    
    -- insert the first node in queue (will be the first taken out)
    queue:enqueue(start)

    -- keep iterating (looking up for neighbours) until queue is empty
    while queue.empty == false do
        -- remove first/older item inserted in queue, we will consider its neighbours
        current_node = queue:dequeue()
        -- do things with the current node
        print(current_node.name)

        -- iterate through its adjacent nodes (neighbours)
        for _, neighbour in ipairs(current_node.lst_neighbours) do
            -- if the adjacent nodes have not been visited yet, then insert them into queue
            if neighbour.visited == false then
                -- we set the node to visited
                neighbour.visited = true
                -- insert it into queue
                queue:enqueue(neighbour)
            end
        end
    end
end

-- TEST 
-- Create nodes with names
nodeA = Node('A')
nodeB = Node('B')
nodeC = Node('C')
nodeD = Node('D')
nodeE = Node('E')


table.insert(nodeA.lst_neighbours, nodeB)
table.insert(nodeA.lst_neighbours, nodeD)
table.insert(nodeB.lst_neighbours, nodeD)
table.insert(nodeD.lst_neighbours, nodeC)
table.insert(nodeD.lst_neighbours, nodeE)


breadth_first_search(nodeA)






