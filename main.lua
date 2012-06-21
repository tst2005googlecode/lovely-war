
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
   g1 = greatHall:new(10, 10, 1) 
   g2 = greatHall:new(30, 30, 2)
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
	    v:goTo(math.floor(x / TILE_X) + nearest[i % 9 + 1][1], math.floor(y / TILE_Y) + nearest[i % 9 + 1][2])
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

   for i,v in ipairs(selection) do
      v:keyPressed(k)
   end
   if k == "q" then
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
