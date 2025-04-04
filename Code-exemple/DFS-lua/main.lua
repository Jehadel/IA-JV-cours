Object = require 'classic' -- module to manage classes/objects in Lua
Stack = require 'stack' -- module to manage stacks

Node = Object:extend() -- create node class

function Node:new(name) -- node class constructor
    self.name = name
    self.lst_neighbours = {}
    self.visited = false
end

function depth_first_search(start)
    local stack = Stack()

    -- push the first node in stack (wil be the last taken out)
    stack:push(start)

    -- keep iterating (looking up for neighbours) 
    while stack.empty == false do
        -- remove last/most recent item in stack, we will consider its neighbours
        current_node = stack:pop()
        -- do things with current node
        print(current_node.name)

        -- iterate through its adjacent nodes (neighbours)
        for _, neighbour in ipairs(current_node.lst_neighbours) do
            -- if the adjacent nodes have not been visited yet, then push them in stack
            if neighbour.visited == false then
                -- we set the node to visited
                neighbour.visited = true
                -- push them into stack
                stack:push(neighbour)
            end
        end
    end
end


-- TEST 1
print('TEST depth_first_search()')
-- Create nodes with names
nodeA = Node('A')
nodeB = Node('B')
nodeC = Node('C')
nodeD = Node('D')
nodeE = Node('E')
nodeF = Node('F')
nodeG = Node('G')

table.insert(nodeA.lst_neighbours, nodeB)
table.insert(nodeA.lst_neighbours, nodeC)
table.insert(nodeA.lst_neighbours, nodeD)
table.insert(nodeB.lst_neighbours, nodeE)
table.insert(nodeE.lst_neighbours, nodeG)
table.insert(nodeC.lst_neighbours, nodeF)


depth_first_search(nodeA)

-- recursive version, we use the stack of the system rather than a custom stack
function rec_depth_first_search(start)
    start.visited = true
    print(start.name)
    
    for _, neighbour in ipairs(start.lst_neighbours) do
        if neighbour.visited == false then
            rec_depth_first_search(neighbour)
        end
    end
end


-- TEST 2
print('TEST recursive version of depth_first_search()')
-- Set all nodes to unvisited
nodeA.visited = false
nodeB.visited = false
nodeC.visited = false
nodeD.visited = false
nodeE.visited = false
nodeF.visited = false
nodeG.visited = false
rec_depth_first_search(nodeA)

