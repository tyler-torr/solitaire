-- Tyler Torrella
-- CMPM 121 - Pickup
-- 4-11-25
io.stdout:setvbuf("no")

require "card"
require "deck"
require "grabber"
require "pile"

function love.load()
  love.window.setTitle("Super Epic & Awesome Solitaire (Amazing Edition)")
  love.window.setMode(960, 640)
  love.graphics.setBackgroundColor(0, 0.7, 0.2, 1)
  
  local piles = {}
  local deck = {}
  
  grabber = GrabberClass:new()
  cardTable = {}
  
  -- Create 7 tableau piles
  piles = {}
  for i = 1, 7 do
    local pile = Pile:new(i * 100, 200)
    for j = 1, i do
      local card =  self.deck
end

function love.update()
  grabber:update()
  
  checkForMouseMoving()
  
  for _, card in ipairs(cardTable) do
    card:update()
  end
end

function love.draw()
  pile:draw()
  
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

function love.mousepressed(x, y, button)
  if button == 1 then
    grabber:grab(cardTable[1])
  end
end

function love.mousepressed(x, y, button)
  if button == 1 then
    grabber:grab(cardTable[1])
  end
end

function love.mousereleased(x, y, button)
  if button == 1 then
    grabber:release()
  end
end