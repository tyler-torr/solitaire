
PileClass = {}

pileOffset = 10 -- Distance between each card on a pile

-- Create a pile of cards 
function PileClass:new(xPos, yPos)
  local pile = {}
  local metadata = {__index = PileClass}
  setmetatable(pile, metadata)
  
  pile.cards = {}
  pile.position = Vector(xPos, yPos)
  pile.size = Vector(50, 70)
  
  return pile
end

function PileClass:addCard(card)
  card.position = Vector(self.x, self.y)
  table.insert(self.cards, card)
end

function PileClass:removeCard(card)
  return table.remove(self.cards)
end

-- Discover the topmost card in the pile
function PileClass:peek()
  return self.cards[#self.cards]
end

function PileClass:isLegal(card)
  local topCard = self:peek()
  
  if topCard then
    -- Check if card's color is different from the top card's color,
    -- and that the value is exactly one lower than the top card's value
    if (card:getColor() ~= topCard:getColor() and card.value == topCard.value - 1) then
      return true
    end
  
  -- If there are no cards, a King can be placed in the pile
  elseif #self.cards == 0 then
    if card.rank == "13" then
      return true
    end
  end
  
  -- Otherwise, this isn't a legal pile
  return false
end

-- Every pile's top card should always be visible
function PileClass:revealCard()
  local topCard = self:peek()
  if topCard then
    topCard.visible = true
  end
end

function PileClass:clear()
  self.cards = {}
end

function PileClass:draw()
  if #self.cards > 0 then
    for i = 1, #self.cards do
      local stackedCard = self.cards[i]
      stackedCard.position = Vector(self.position.x, self.position.y + i * pileOffset)
      stackedCard:draw()
    end
    self:revealCard()
  end
end