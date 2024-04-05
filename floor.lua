floor = {

    x=0,
    y=120,
    moving=true,
    sprite=love.graphics.newImage("assets/sprites/floor.png"),
    width=8

}

function floor:update(dt)

    --moves floor to make illusion of movement
    floor.x=floor.x-((game.movespd*game.multiplier)*dt)

    --resets x value to prevent memory leak
    if floor.x < -(floor.width) then
        
        floor.x=0

    end


end

function floor:draw()

    --love.graphics.print(floor.x, 5, 10)

    --8*32
    for i=floor.x,floor.width*(gameWidth/floor.width),floor.width do
        love.graphics.draw(floor.sprite, i, 120)
    end

end

function floor:stop()

    floor.moving = false

end