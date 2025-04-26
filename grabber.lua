
require "vector"
require "card"

GrabberClass = {}

function GrabberClass:new()
  local grabber = {}
  local metadata = {__index = GrabberClass}
  setmetatable(grabber, metadata)
  
  grabber.heldObject = nil
  grabber.offset = nil
  
  grabber.previousMousePos = nil
  grabber.currentMousePos = nil
  
  grabber.grabPos = nil
  
  return grabber
end

function GrabberClass:update()
  self.previousMousePos = self.currentMousePos
  self.currentMousePos = Vector(
    love.mouse.getX(), 
    love.mouse.getY()
  )
  
  -- Click
  if love.mouse.isDown(1) and self.grabPos == nil then
    self:grab()
  end
  -- Release
  if not love.mouse.isDown(1) and self.grabPos ~= nil then
    self:release()
  end
  if self.heldObject then
    self.heldObject.position = self.currentMousePos - self.offset
  end
end

function GrabberClass:grab()
  for _, pile in ipairs(cardTable) do
    for _, card in ipairs(pile.cards) do
      if card.state == CARD_STATE.MOUSE_OVER then
        self.heldObject = card
        
        if not card.position then
          print("Card position is nil!")
        end
        
        if not self.currentMousePos then
          print("Error: currentMousePos is nil")
        end

        if card.position and self.currentMousePos then
          self.offset = self.currentMousePos - card.position
          card.state = CARD_STATE.GRABBED
          print("GRAB - " .. tostring(self.heldObject.suit) .. " " .. tostring(self.heldObject.rank))
          pile:removeCard(card)
          break
        end
      end
    end
  end
end

function GrabberClass:release()
  if self.heldObject == nil then return end
  
  print("RELEASE - " .. tostring(self.heldObject.suit) .. " " .. tostring(self.heldObject.rank))
  
  self.heldObject.state = CARD_STATE.IDLE
  self.heldObject = nil
  self.offset = nil
end

function GrabberClass:checkForMouseOver(cardTable)
  if not self.visible then return end
  if self.heldObject ~= nil then return end
  
  local mouse = self.currentMousePos
  for _, pile in ipairs(cardTable) do
    for _, card in ipairs(pile.cards) do
      if card.state == CARD_STATE.IDLE or card.state == CARD_STATE.MOUSE_OVER then
        if card:contains(mouse) then
          card.state = CARD_STATE.MOUSE_OVER
        else
          card.state = CARD_STATE.IDLE
        end
      end
    end
  end
end