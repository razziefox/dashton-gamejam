title_screen = {

    sfx = love.audio.newSource("assets/sfx/start.wav", "static")

}

function title_screen:update()

    if input:pressed 'action' then

        game.isPlaying = true
        game.isGameover = false
        --title_screen.sfx:play()

    end

end

function title_screen:draw()

    love.graphics.print("dashton", game.width/2-18, game.height/2-10)
    love.graphics.print("Press X key or A button to start", game.width/2-66, game.height/2+2)
    love.graphics.print("game by florencio", game.width/2-34, game.height-8)

end