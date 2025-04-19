-- Tyler
-- CMPM 121 - Update
-- 4-7-2025

-- Code gotten from class, will elaborate on later.

require "entity"

function love.load()
  screenWidth = 640
  screenHeight = 480
  love.window.setMode(screenWidth, screenHeight)
  love.graphics.setBackgroundColor(0.2, 0.7, 0.2, 1)
  
  entityTable = {}
  
  table.insert(entityTable, 
   EntityClass:new(screenWidth/2, screenHeight/2, 50, 50) 
  )
end

function love.update()
  for _, entity in ipairs(entityTable) do
    entity:update()
  end
end

function love.draw()
  for _, entity in ipairs(entityTable) do
    entity:draw()
  end
end