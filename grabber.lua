
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
  
  return grabber
end

function GrabberClass:grab()
  print("GRAB - ")
  
  for _, card in ipairs(cardTable) do
    -- If mouse is hovering over a card and is currently holding nothing
    if card.state == CARD_STATE.MOUSE_OVER and self.heldObject == nil then
      self.heldObject = card
      self.offset = grabber.currentMousePos - card.position
      card.state = CARD_STATE.GRABBED
      break
    end
  end
end

function GrabberClass:release()
  print("RELEASE - ")
  -- Check if there's nothing to release
  if self.heldObject == nil then
    return
  end
  
  if self.heldObject then
    self.heldObject.state = CARD_STATE.IDLE
  end
  self.heldObject = nil
  self.offset = nil
end

function GrabberClass:checkForMouseOver()
  if not self.visible then return end
  if grabber.heldObject ~= nil then return end
  
  local mouse = grabber.currentMousePos
  if mouse.x > self.position.x and mouse.x < self.position.x + self.size.x and
     mouse.y > self.position.y and mouse.y < self.position.y + self.size.y then
     
    if love.mouse.isDown(1) and grabber.grabPos == nil then
      grabber.heldObject = self
      grabber.grabPos = Vector(self.position.x, self.position.y)
      self.state = CARD_STATE.GRABBED
    end
  end
end

function GrabberClass:update()
  self.previousMousePos = self.currentMousePos
  self.currentMousePos = Vector(love.mouse.getX(), love.mouse.getY())
  
  if self.heldObject then
    self.heldObject.position = Vector(
      self.currentMousePos.x - self.heldObject.size.x / 2,
      self.currentMousePos.y - self.heldObject.size.y / 2
    )
  end
end