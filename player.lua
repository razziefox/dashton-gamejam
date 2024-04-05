local atlas = require "libs/atlas"

require "floor"

player = {

    x=48,
    y=112,
    grav=2,
    vspd=0,
    jump=80,
    width=8,
    height=8,
    texture=atlas.load("assets/sprites/player/bird"),
    flapping=love.audio.newSource("assets/sfx/flap.wav", "static"),
    hurt=love.audio.newSource("assets/sfx/hit.wav", "static"),
    ground=true,
    sprite=0

}

local animation = {}

function player:load()

    animation[0] = player.texture:newAnimation("walk.png", 3, 0.08)
    animation[1] = player.texture:newSprite("hurt.png")
    animation[2] = player.texture:newSprite("flap.png")
    animation[3] = player.texture:newSprite("fall.png")

end

function player:update(dt)

    player.y = player.y + (player.vspd*dt)

    player.vspd = player.vspd + player.grav

    if player.y < 0 then
        
        player.y = 0
        player.vspd = 0

    end
    if player.y > 111 then
        
        player.y = 112
        player.ground = true

    else player.ground = false
    end

    if player.sprite ~= nil and player.sprite == 0 then
        
        animation[player.sprite]:update(dt)

    end

    if input:pressed 'action' and game.isPlaying == true and game.isGameover == false then
        
        player:flap()
        --player:hit()

    end

    if game.isGameover == true and player.sprite ~= 1 then
        
        player.sprite = 1
        --player:setSprite("hurt.png")

    end

    player:animation()


end

function player:draw()

    if player.sprite ~= nil then
        --player.sprite:draw(player.x, player.y)
        animation[player.sprite]:draw(player.x, player.y)
        --love.graphics.print(tostring(player.ground),4,20)

    end


end

function player:animation()

    --checks if player is on ground
    if player.ground == true and game.isGameover ~= true then
        
        --set walking sprite
        player.sprite = 0

    end

    if player.vspd < 0 and game.isGameover ~= true and player.ground ~= true then
        
        player.sprite = 2

    end

    if player.vspd > 0 and game.isGameover ~= true and player.ground ~= true then
        
        player.sprite = 3

    end



end

function player:restart()

    player.y = 112
    player.vpsd = 0
    player.sprite = 0

end

function player:flap(dt)

    player.vspd = -player.jump
    player.flapping:play()

end

function player:hit()

    if game.isGameover ~= true then
        game.isGameover = true
        floor:stop()
        player.hurt:play()
    end

    player.ground = false
    game.isGameover = true
    game.isPlaying = false

end