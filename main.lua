-- Tyler Torrella
-- CMPM 121 - Pickup
-- 4-11-25
io.stdout:setvbuf("no")

require "card"
require "deck"
require "grabber"
require "pile"

local deck

local BACKGROUND_COLOR = {0, 0.7, 0.2, 1}
local WHITE = {1, 1, 1, 1}
local SCREEN_WIDTH = 960
local SCREEN_HEIGHT = 640

local NUM_TABLEAU_PILES = 7
local TABLEAU_DISTANCE = 50

function love.load()
  love.window.setTitle("Super Epic & Awesome Solitaire (Amazing Edition)")
  love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)
  love.graphics.setBackgroundColor(BACKGROUND_COLOR)
  
  grabber = GrabberClass:new()
  cardTable = {}
  
  deck = DeckClass:new()

  -- Initialize tableau piles
  for i = 1, NUM_TABLEAU_PILES do
    local pile = PileClass:new(i * TABLEAU_DISTANCE, 200)
    -- Draw each card in tableau pile (1 card in pile 1, 2 cards in pile 2, etc)
    for j = 1, i do
      local card = deck:draw()
      pile:addCard(card)
    end
    table.insert(cardTable, pile)
  end

  
end

function love.update()
  grabber:update()
  
  checkForMouseMoving()
  grabber:checkForMouseOver(cardTable)
  
  for _, pile in ipairs(cardTable) do
    for _, card in ipairs(pile.cards) do
      card:update()
    end
  end
end

function love.draw()
  -- Draw the tableau piles
  for _, pile in ipairs(cardTable) do
    pile:draw()
  end
  
  if grabber.heldObject then
    grabber.heldObject:draw()
  end
  
  love.graphics.setColor(WHITE)
  love.graphics.print("Mouse: " .. tostring(grabber.currentMousePos.x) .. ", " .. tostring(grabber.currentMousePos.y))
end

function checkForMouseMoving()
  if grabber.currentMousePos == nil then
    return
  end
  
  for _, pile in ipairs(cardTable) do
    for _, card in ipairs(pile.cards) do
      card:checkForMouseOver()
    end
  end
end

function love.mousepressed(x, y, button)
  if button == 1 then
    grabber:grab()
  end
end

function love.mousereleased(x, y, button)
  if button == 1 then
    grabber:release()
  end
end