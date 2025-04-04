local maze = {
    {'_', '_', '_', '_', '_', '_', '_', '_'},
    {'|', 'D', '*', ' ', ' ', ' ', '*', '|'},
    {'|', ' ', ' ', ' ', '*', ' ', ' ', '|'},
    {'|', '*', ' ', '*', ' ', ' ', ' ', '|'},
    {'|', '*', '*', '*', ' ', '*', '*', '|'},
    {'|', '*', ' ', ' ', ' ', ' ', ' ', '|'},
    {'|', ' ', ' ', '*', '*', ' ', ' ', '|'},
    {'|', '*', ' ', ' ', '*', ' ', ' ', '|'},
    {'|', '*', '*', ' ', ' ', ' ', 'A', '|'},
    {'¯', '¯', '¯', '¯', '¯', '¯', '¯', '¯'}
}

-- function to copy tables by value (recursively, to copy as well tables within tables -> "deep")
function deepCopy(table_to_copy)
    local copy = {}
    for k, v in pairs(table_to_copy) do
        if type(v) == 'table' then
            copy[k] = deepCopy(v)  -- Recursive call
        else
            copy[k] = v
        end
    end
    return copy
end


local solution = deepCopy(maze)

local visited = {}


function isVisited(x, y)
    -- we name keys by combining the coordinates of the node marked (easier retrieving) 
    local key = x .. "," .. y
    return visited[key] == true
end


function markVisited(x, y)
    local key = x .. "," .. y
    visited[key] = true
end


--[[ -- in some cases we may need to unmark a visited node () (not the case here)
function unmarkVisited(x, y)
    local key = x .. "," .. y
    visited[key] = nil -- or false
end
]]

function disp_maze(p_maze)

    for _, l in ipairs(p_maze) do 
        local s = ''
        for _, c in ipairs(l) do
            s = s..c
        end
        print(s)
    end
end


function found_end(x, y)

    if maze[y][x] == 'A' then
        solution[y][x] = '▮'
        return true
    end

    return false

end


function valid(x, y)

    if x < 2 or x > #maze[y]-1 then
        return false
    end

    if y < 2 or y > #maze-1 then
        return false
    end

    if maze[y][x] == '*' then
        return  false
    end

    return true

end


function solve(x, y)
--[[ uncomment if you want to follow the algorithm progression
    print(x)
    print(y)
    disp_maze(solution)
    print('---')
    ]]

    if found_end(x, y) then
        return true
    end

    if valid(x, y) and not isVisited(x, y) then
        markVisited(x, y)
        solution[y][x] = '▮'
        
        if solve(x, y+1) then
            return true
        end

        if solve(x+1, y) then
            return true
        end
        
        if solve(x, y-1) then
            return true
        end


        if solve(x-1, y) then
            return true
        end

        solution[y][x] = '·'

    end

    return false

end


function find_solution()
    x = 2
    y = 2

    if solve(x, y) then
        disp_maze(solution)
    else
        print('The maze has no solution.')
    end

end

print('Maze:')
disp_maze(maze)
print('Solution:')
find_solution(maze)