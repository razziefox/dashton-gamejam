require "player"

cactus = {

    x=game.width+32,
    y=112,
    width=8,
    height=8,
    sprite=love.graphics.newImage("assets/sprites/cactus.png")

}

function cactus:update(dt)

    if game.isPlaying == true or game.isGameover == true then

        --moves floor to make illusion of movement
        cactus.x=cactus.x-((game.movespd*game.multiplier)*dt)

        if cactus.x+cactus.width < 0 then

            cactus:respawn()

        end
    
    end

    if isHit(cactus.x, cactus.y, cactus.width, cactus.height, player.x, player.y, player.height, player.width) and game.isGameover == false then

        player:hit()

    end

end

function cactus:draw()

    love.graphics.draw(cactus.sprite, cactus.x, cactus.y)

end

function cactus:respawn()

    cactus.x=game.width+32

end