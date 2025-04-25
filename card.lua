
require "vector"

CardClass = {}

CARD_STATE = {
  IDLE = 0,
  MOUSE_OVER = 1,
  GRABBED = 2
}

function CardClass:new(suit, rank, visible, xPos, yPos)
  local imagePath = "cards/" .. suit .. " " .. tostring(rank) .. ".png"
  
  local card = {}
  local metadata = {__index = CardClass}
  setmetatable(card, metadata)
  
  card.suit = suit
  card.rank = rank
  card.visible = visible or false
  card.position = Vector(xPos, yPos)
  card.size = Vector(50, 70)
  card.state = CARD_STATE.IDLE
  
  card.image = love.graphics.newImage(imagePath)
  card.imageBack = love.graphics.newImage("cards/Card Back.png")
  return card
end

function CardClass:draw()
  if self.visible then
    love.graphics.draw(self.image, self.position.x, self.position.y)
  else
    love.graphics.draw(self.imageBack, self.position.x, self.position.y)
  end
end

function CardClass:checkForMouseOver()
  if self.state == CARD_STATE.GRABBED then
    return
  end
  
  local mousePos = grabber.currentMousePos
  local isMouseOver = 
    mousePos.x > self.position.x and 
    mousePos.x < self.position.x + self.size.x and 
    mousePos.y > self.position.y and 
    mousePos.y < self.position.y + self.size.y
  
  self.state = isMouseOver and CARD_STATE.MOUSE_OVER or CARD_STATE.IDLE
end

function CardClass:getColor()
  if (self.suit == "Hearts" or self.suit == "Diamonds") then
    return "red"
  else
    return "black"
  end
end

function CardClass:update()
  
end