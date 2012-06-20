
require('externallibs/middleclass/middleclass')
require('externallibs/string/string')
Jumper = require('externallibs.jumper')

require('objects')

local selecting = false
local start_x = 0
local start_y = 0

local i = 0

local selection = {}

function love.load()
   p1 = peon:new(2, 2, 1) 
   p1 = peon:new(4, 2, 1) 
   p1 = peon:new(5, 2, 1) 
   p1 = peon:new(6, 2, 1) 
   p1 = peon:new(7, 2, 1) 
   p1 = peon:new(8, 2, 1) 
   p1 = peon:new(9, 2, 1) 
   p1 = peon:new(10,2, 1) 
   p1 = peon:new(11, 2, 1) 
   p1 = peon:new(12, 2, 1) 
   p1 = peon:new(13, 2, 1) 
   p1 = peon:new(14, 2, 1) 
   p1 = peon:new(15, 2, 1) 

   g1 = greatHall:new(3, 2, 1) 
end

function love.update(dt)
   if i > 1000 * dt  then
      for i,v in ipairs(objects) do
	 v:update(dt)
      end
      i = 0
   end
   i = i + 1
end

function love.draw()
   local i = 1
   while i < MAP_X do
      local j = 1
      while j < MAP_Y do
	 if map[i][j] ~= 1 then
	    map[i][j]:draw()
	 end
	 j = j + 1
      end
      i = i + 1
   end
end

function love.mousepressed(x, y, button)
   if button == "l" then
      start_x = math.floor(x / TILE_X)
      start_y = math.floor(y / TILE_Y)
      selecting = true
   end
   if button == "r" then
      if map[math.floor(x / TILE_X)][math.floor(y / TILE_Y)] == 1 then
	 pather = Jumper(cpy(), 1, true)
	 pather:setHeuristic('DIAGONAL')
	 for i,v in ipairs(selection) do
	    h = math.random(2) - 1
	    w = math.random(2) - 1
	    v:goTo(math.floor(x / TILE_X) + h, math.floor(y / TILE_Y) + w)
	 end
      end      
   end
end

function love.mousereleased(x, y, button)
   if button == "l" then
      selecting = false
      selection = {}
      local i = 0
      local t = x / TILE_X
      local k = y / TILE_Y
      while start_x + i < t do
	 local j = 0
	 while start_y + j < k do
	    if map[start_x + i] ~= nil and map[start_x + i][start_y + j] ~= 1 then
	       table.insert(selection, map[start_x + i][start_y + j])
	    end
	    j = j + 1
	 end
	 i = i + 1
      end
   end
end

function love.keypressed(k)
   if k == "p" then
   local i = 1
   while i < MAP_X do
      local j = 1
      while j < MAP_Y do
	 if map[i][j] ~= 1 then
	    print(map[i][j])
	 end
	 j = j + 1
      end
      i = i + 1
   end
end
end

function love.quit()
end
