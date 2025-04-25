
require "card"

DeckClass = {}

-- Initialize 52 cards inside a new deck
function DeckClass:new()
  local deck = {}
  local metadata = {__index = DeckClass}
  setmetatable(deck, metadata)
  
  deck.cards = {}
  local suits = {"Hearts", "Diamonds", "Clubs", "Spades"}
  local ranks = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"} -- I know I didn't use A/J/Q/K oops
  
  for _, suit in ipairs(suits) do
    for _, rank in ipairs(ranks) do
      table.insert(deck.cards, CardClass:new(suit, rank, false, 0, 0))
    end
  end
  
  deck:shuffle()
  
  return deck
end

function DeckClass:shuffle()
  math.randomseed(os.time())
  
  for i = 1, #self.cards do
    local rand = math.random(1, #self.cards)
    self.cards[i], self.cards[rand] = self.cards[rand], self.cards[i]
  end
end

-- Add a card to a deck
function DeckClass:addCard(card)
  table.insert(self.cards, card)
end

-- Pop last card off of deck
function DeckClass:draw()
  return table.remove(self.cards)
end

