local GAIN = 1
local INF = math.huge

local game = {}
game.player_mark = 'O'
game.ia_mark = 'X'
game.board = {}
for i=1, 9 do
    table.insert(game.board, ' ')
end


function game.instructions()

    print('_______')
    print('|7|8|9|')
    print('-------')
    print('|4|5|6|')
    print('-------')
    print('|1|2|3|')
    print('¯¯¯¯¯¯¯')

    print('Tic-tac-toe game. You play the "O", IA plays the "X". Enter the cell number (has indicated above) you want to play when asked.')

    game.disp()
end
    

function game.disp()
    print('_______')
    print('|'..game.board[7]..'|'..game.board[8]..'|'..game.board[9]..'|')
    print('-------')
    print('|'..game.board[4]..'|'..game.board[5]..'|'..game.board[6]..'|')
    print('-------')
    print('|'..game.board[1]..'|'..game.board[2]..'|'..game.board[3]..'|')
    print('¯¯¯¯¯¯¯')
end


function game.free_cell(cell)
    -- check if the cell is playable
    if game.board[cell] == ' ' then
        return true
    end
    
    return false

end


function game.is_draw()

    --[[
        if victory conditions have already been assessed before
        draw game is just when the board is full (and no victory)
        i.e. when no empty cell remain
    ]]
    
    for _, v in ipairs(game.board) do
        if v == ' ' then
            return false
        end
    end

    return true

end


function game.is_victory(player)
    --[[
    victory is when 3 symbol of a player are in :
    - a row
    - a column
    - a diagonal  ]]

    -- diagonals check
    is_diagonal1 = game.board[1] == player 
                    and game.board[5] == player 
                    and game.board[9] == player
    is_diagonal2 = game.board[3] == player 
                    and game.board[5] == player
                    and game.board[7] == player
    is_diagonals = is_diagonal1 or is_diagonal2

    for i = 0, 2 do 

        -- row check
        is_row = game.board[3*i+1] == player 
            and game.board[3*i+2] == player
            and game.board[3*i+3] == player

        -- column check
        is_column = game.board[i+1] == player 
            and game.board[i+4] == player
            and game.board[i+7] == player
       
        if is_row or is_column or is_diagonals then
            return true
        end

    end

    return false

end


function game.is_endgame()

    if game.is_victory(game.player_mark) then
        print('You win!')
        return true
    end

    if game.is_victory(game.ia_mark) then
        print('You lose!')
        return true
    end
    
    if game.is_draw() then
        print('Draw game!')
        return true
    end
 
    return false

end


function game.player_turn()
    -- ask the player to chose a cell where to play, and 
    -- call the player_is_valid() fucntion to check if its a valid coup

    print('Enter the cell you want to play:')
    cell = tonumber(io.read())
    
    game.player_validity(cell)

end


function game.player_validity(cell)

    if game.free_cell(cell) then

        game.board[cell] = game.player_mark
    else
        print('Cell has already been played or invalid input. Chose a valid cell.')
        game.player_turn()

    end

end

function game.minimax(maximize)

    -- if the move is a winning move, return GAIN value (victory score)
    if game.is_victory(game.ia_mark) then
        return GAIN
    end

    -- if the move is a losing move, return -GAIN value (defeat score)
    if game.is_victory(game.player_mark) then
        return -GAIN
    end
    
    -- if the move leads to a draw game, return 0
    if game.is_draw() then
        return 0
    end

    --[[ 
    if we are note in one this situation, we have to go deeper and start
    a DFS (recursive). the search will be performed differently depending 
    on whether we are at a stage where we need to maximize or minimize 
    (depending on whether the next move is for the player or the AI)
]]
    -- do we have to maximize ?
    if maximize then
        local best_score = -INF

        for cell_idx, cell_value in ipairs(game.board) do
           -- we will evaluate each empty cell
            if cell_value == ' ' then
           -- we simulate a move (i.e : let’s see what happens if ia play this cell)
                game.board[cell_idx] = game.ia_mark
                -- recursive call (as required in DFS)
                -- if we are at a maximize step, next step should minize (maximize = false)
                score =  game.minimax(false)
                -- once it’s done, we cancel the simulation and go back to previous state
                game.board[cell_idx] = ' '

                -- now we maximize (if new score > best score we update the best score)
                best_score = math.max(score, best_score)
            
            end

        end

        return best_score

    else
        -- we are at a minimizer step
        local best_score = INF
        -- we process almost the same as for the maximizer :
        for cell_idx, cell_value in ipairs(game.board) do
            -- we evaluate empty cells
            if cell_value == ' ' then
                game.board[cell_idx] = game.player_mark
                -- recursive call (next step should maximize this time)
                score = game.minimax(true)
                -- once it’s done, we cancel the simulation and go back to game previous state
                game.board[cell_idx] = ' '

                -- now we minimize (if new score < best score we update the best score)
                best_score = math.min(score, best_score)

            end

        end

        return best_score

    end

end

function game.ia_turn()

    best_score = -INF
    best_move = 0
    
    -- calculate the minimax
    -- for each empty cell on the board
    for cell_idx, cell_val in ipairs(game.board) do
        if cell_val == ' ' then
            -- we simulate this move (i.e : let’s see what happens if ia play this cell)
            game.board[cell_idx] = game.ia_mark
            -- maximizer = false (minimize) because after we play, we evaluate the human player moves
            score = game.minimax(false)
            -- once the move has been evaluated, we go back to the initial configuration (we cancel the simulated move)
            game.board[cell_idx] = ' ' 
            --[[ uncomment to follow the score/bestscore
            print(score)
            print(best_score)
            print('--')
            ]]

            if score > best_score then
                best_score = score
                best_move = cell_idx
            end
        
        end

    end

    -- finally we play the selected move 
    game.board[best_move] = game.ia_mark
    
    --[[ uncomment to see the best_move selected
    print(best_move)
    ]]

end

game.instructions()

while true do
    game.player_turn() -- player update
    game.disp() -- draw player move
    if game.is_endgame() then break end
    game.ia_turn() -- ia update
    game.disp() -- draw ia move
    if game.is_endgame() then break end
end
