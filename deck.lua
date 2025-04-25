
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
  
  return deck
end

function DeckClass:shuffle()
  -- Uhhhh come back to this later??
end

-- Pop last card off of deck
function DeckClass:draw()
  return table.remove(self.cards)
end

