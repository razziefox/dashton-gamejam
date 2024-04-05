gameover = {}

function gameover:update()

    if input:pressed 'action' then

        game:restart()

    end

end

function gameover:draw()

    love.graphics.print("Gameover", game.width/2-20, game.height/2-10)
    love.graphics.print("Press X key or A button to restart", game.width/2-68, game.height/2+2)

end

