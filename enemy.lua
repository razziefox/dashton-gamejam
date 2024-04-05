require "player"

enemy = {

    x=game.width+16,
    y=8,
    width=8,
    height=4,
    sprite=love.graphics.newImage("assets/sprites/enemy.png")

}

function enemy:load()

    enemy:respawn()

end

function enemy:update(dt)

    if game.isPlaying == true or game.isGameover == true then

        --moves floor to make illusion of movement
        enemy.x=enemy.x-((game.defaultspd*game.multiplier*2)*dt)

        if enemy.x+enemy.width < 0 then

            enemy:respawn()

        end
    
    end

    if isHit(enemy.x+1, enemy.y+2, enemy.width-1, enemy.height, player.x, player.y, player.height, player.width) and game.isGameover == false then

        player:hit()

    end

end

function enemy:draw()

    love.graphics.draw(enemy.sprite, enemy.x, enemy.y)

end

function enemy:respawn()

    enemy.x = game.width+16
    enemy.y = love.math.random(8, 104)

end