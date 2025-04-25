
PileClass = {}

-- Create a pile of cards 
function PileClass:new(xPos, yPos)
  local pile = {}
  local metadata = {__index = PileClass}
  setmetatable(pile, metadata)
  
  pile.cards = {}
  card.position = Vector(xPos, yPos)
  card.size = Vector(50, 70)
  card.state = CARD_STATE.IDLE
  
  return pile
end

function PileClass:add(card)
  table.insert(self.cards, card)
end

function PileClass:remove(card)
  return table.remove(self.cards)
end
