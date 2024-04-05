love.graphics.setDefaultFilter("nearest", "nearest")


local push = require "libs/push"
baton = require "libs/baton"
--require "libs/strike"



game = {

    width=256,
    height=144,
    scale=4,
    multiplier=1,
    score=0,
    defaultspd=80,
    movespd=80,
    isPlaying=false,
    isGameover=false

}

input = baton.new {
    controls = {
      action = {'key:x', 'button:a'}
    }
  }

require "floor"
require "player"
require "balloon"
require "enemy"
require "gameover"
require "title_screen"
require "background"
require "cactus"

gameWidth, gameHeight = 256, 144 --fixed game resolution
local gameScale = 4

push:setupScreen(gameWidth, gameHeight, gameWidth*gameScale, gameHeight*gameScale, {fullscreen = false, resizable = true, highdpi=true})



function love.load()

    local font = love.graphics.newFont("assets/font.ttf", 5, "mono")
    love.graphics.setFont(font)

    player:load()
    balloon:load()
    enemy:load()

end

function love.update(dt)

    floor:update(dt)
    player:update(dt)
    balloon:update(dt)
    enemy:update(dt)
    cactus:update(dt)

    if game.isGameover == true and game.isPlaying == false then
        gameover:update()
    end

    if game.isPlaying == false and game.isGameover == false then

        title_screen:update()

    end

    --if bird gets hit
    if game.isGameover == true then

        if game.movespd > 0 then
            game.movespd=game.movespd-(game.movespd/18)
        end

        game.multiplier = 1

    end

    

    
end

function love.draw()


    push:start()

    if game.isPlaying == true then
        love.graphics.print("score: "..game.score, 4, 4)
    end

    input:update()
    floor:draw()
    player:draw()
    balloon:draw()
    enemy:draw()
    background:draw()
    cactus:draw()

    if game.isGameover == true and game.isPlaying == false then
        gameover:draw()
    end

    if game.isPlaying == false and game.isGameover == false then

        title_screen:draw()

    end

    push:finish()
    

end

function game:restart()

    game.isPlaying = false
    game.isGameover = false
    game.score = 0
    game.multiplier = 1
    game.movespd = game.defaultspd
    player:restart()
    enemy:respawn()
    balloon:respawn()
    cactus:respawn()

end

function love.resize(w, h)
    return push:resize(w, h)
end