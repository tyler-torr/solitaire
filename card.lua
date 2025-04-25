
require "vector"

CardClass = {}

rank = {'A','2','3','4','5','6','7','8','9','10','J','Q','K',}
SUIT_ENUM = {
  SPADE,
  CLUB,
  HEART,
  DIAMOND
}

CARD_STATE = {
  IDLE = 0,
  MOUSE_OVER = 1,
  GRABBED = 2
}

-- Colors
white = {1, 1, 1, 1}
red = {1, 0, 0, 1}
black = {0, 0, 0, 1}

function CardClass:new(rank, suit, visible, xPos, yPos)
  local card = {}
  local metadata = {__index = CardClass}
  setmetatable(card, metadata)
  
  card.rank = rank
  card.suit = suit
  card.visible = visible or false
  card.position = Vector(xPos, yPos)
  card.size = Vector(50, 70)
  card.state = CARD_STATE.IDLE
  
  return card
end

function CardClass:draw()
  if self.visible then
    -- Draw rank & suit
    if (self.suit == SPADE or self.suit == CLUB) then
      love.graphics.setColor(black)
    else
      love.graphics.setColor(red)
    end
    love.graphics.print(self.rank .. " " .. self.suit, self.position.x + 5, self.position.y + 5)
    
    -- Then color the card white
    love.graphics.setColor(white)
  else
    -- If not visible, draw the color black
    love.graphics.setColor(black)
  end
  
  love.graphics.rectangle("fill", self.position.x, self.position.y, self.size.x, self.size.y, 6, 6)
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