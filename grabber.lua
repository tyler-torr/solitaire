
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
  
  print("Why don't you grab. I beg")
  
  for _, card in ipairs(cardTable) do
    -- If mouse is hovering over a card and is currently holding nothing
    if card.state == CARD_STATE.MOUSE_OVER and self.heldObject == nil then
      self.heldObject = card
      self.offset = self.currentMousePos - card.position
      card.state = CARD_STATE.GRABBED
      break
    end
  end
end

function GrabberClass:release()
  if self.heldObject == nil then return end -- Check if there's nothing to release
  print("RELEASE - ")
  
  if self.heldObject then
    self.heldObject.state = CARD_STATE.IDLE
  end
  self.heldObject = nil
  self.offset = nil
end

function GrabberClass:checkForMouseOver(cardTable)
  if not self.visible then return end
  if grabber.heldObject ~= nil then return end
  
  local mouse = grabber.currentMousePos
  for _, card in ipairs(cardTable) do
    if card.state == CARD_STATE.IDLE or card.state == CARD_STATE.MOUSE_OVER then
      if card:contains(mouse) then
        card.state = CARD_STATE.MOUSE_OVER
      else
        card.state = CARD_STATE.IDLE
      end
    end
  end
end

function GrabberClass:update()
  self.previousMousePos = self.currentMousePos
  self.currentMousePos = Vector(love.mouse.getX(), love.mouse.getY())
  
  if self.heldObject then
    self.heldObject.position = self.currentMousePos - self.offset
  end
end