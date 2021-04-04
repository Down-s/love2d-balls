local ball = require("ball")

local tBalls = {}
local BallCount = 200

function love.load()
    for i = 1, BallCount do
        local ball = ball.Create()
        ball:SetPos(math.random(0, love.graphics.getWidth()), math.random(0, love.graphics.getHeight()))
        ball:SetRadius(math.random(32, 64))
        ball:SetColor(math.random(), math.random(), math.random())

        tBalls[i] = ball
    end
    
    love.window.setTitle("Balls!")
    love.graphics.setBackgroundColor(0.03, 0.03, 0.03)
end

function love.draw()
    for i, ball in ipairs(tBalls) do
        if (i == BallCount) then
            local mx, my = love.mouse.getPosition()
            ball:SetPos(mx, my)
        end

        ball:Render()
        ball:PhysicsUpdate(tBalls)
    end
end
