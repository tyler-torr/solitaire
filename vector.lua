
-- Code given by Zac in lecture during CMPM 121
-- Establishes a Vector class that holds a pair of numbers
-- Allows calling, adding, subtracting, multiplying & comparing if equal

Vector = {}

metatable = { -- Define Vector meta methods
  __call = function(self, a, b)
    local vec = {
      x = a or 0,
      y = b or 0
    }
    setmetatable(vec, metatable)
    return vec
  end,
  __add = function(a, b)
    if type(a) == "number" then return Vector(a + b.x, a + b.y) end
    if type(b) == "number" then return Vector(a.x + b, a.y + b) end
    return Vector(a.x + b.x, a.y + b.y)
  end,
  __sub = function(a, b)
    if type(a) == "number" then return Vector(a - b.x, a - b.y) end
    if type(b) == "number" then return Vector(a.x - b, a.y - b) end
    return Vector(a.x - b.x, a.y - b.y)
  end,
  __mul = function(a, b)
    if type(a) == "number" then return Vector(a * b.x, a * b.y) end
    if type(b) == "number" then return Vector(a.x * b, a.y * b) end
    return Vector(a.x * b.x, a.y * b.y)
  end,
  __eq = function(a, b)
    if type(a) ~= "table" or type(b) ~= "table" then return false end
    local xClose = math.abs(a.x - b.x) < 1
    local yClose = math.abs(a.y - b.y) < 1
    return xClose and yClose
  end
}

setmetatable(Vector, metatable)