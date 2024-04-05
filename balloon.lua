local atlas = require "libs/atlas"

require "player"
require "libs/strike"

balloon = {

    x=game.width+8,
    y=16,
    width=8,
    height=8,
    texture=atlas.load("assets/sprites/balloon/balloon"),
    popping=love.audio.newSource("assets/sfx/pop.wav", "static"),
    popped=false

}

function balloon:load()

    balloon:respawn()
    balloon.sprite = balloon.texture:newAnimation("balloon.png", 2, 0.6)

end

function balloon:update(dt)

    balloon.sprite:update(dt)

    if game.isPlaying == true or game.isGameover == true then

        --moves floor to make illusion of movement
        balloon.x=balloon.x-((game.movespd*game.multiplier)*dt)

        if balloon.x+balloon.width < 0 then

            balloon:respawn()

        end
    
    end

    if isHit(balloon.x, balloon.y, balloon.width, balloon.height, player.x, player.y, player.height, player.width) and balloon.popped == false then

        balloon.popped = true
        game.score = game.score + 1
        game.multiplier = game.multiplier + 0.06
        balloon.popping:play()

    end

end

function balloon:draw()

    if balloon.popped == false then
        balloon.sprite:draw(balloon.x, balloon.y)
        --love.graphics.rectangle("fill", balloon.x, balloon.y, 8, balloon.width)
    end

end

function balloon:respawn()

    balloon.x = game.width+8
    balloon.y = love.math.random(8, 104)
    balloon.popped = false

end