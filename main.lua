-- Tyler Torrella
-- CMPM 121 - Pickup
-- 4-11-25
io.stdout:setvbuf("no")

require "card"
require "deck"
require "grabber"
require "pile"

function love.load()
  love.window.setMode(960, 640)
  love.graphics.setBackgroundColor(0, 0.7, 0.2, 1)
  
  grabber = GrabberClass:new()
  cardTable = {}
  
  table.insert(cardTable, CardClass:new("Clubs", 2, true, 100, 100))  
end

function love.update()
  grabber:update()
  
  checkForMouseMoving()
  
  for _, card in ipairs(cardTable) do
    card:update()
  end
end

function love.draw()
  for _, card in ipairs(cardTable) do
    card:draw()
  end
  
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("Mouse: " .. tostring(grabber.currentMousePos.x) .. ", " .. tostring(grabber.currentMousePos.y))
end

function checkForMouseMoving()
  if grabber.currentMousePos == nil then
    return
  end
  
  for _, card in ipairs(cardTable) do
    card:checkForMouseOver(grabber)
  end
end
