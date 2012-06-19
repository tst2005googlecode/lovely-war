
require('externallibs/middleclass/middleclass')
require('externallibs/string/string')
require('externallibs/jumper/jumper')

require('objects')

function love.load()
   p1 = peon:new(2, 2, 1) 
end

function love.update(dt)

end

function love.draw()

local i = 1
while i < MAP_X do
   local j = 1
   while j < MAP_Y do
      if map[i][j] ~= 0 then
	 map[i][j]:draw()
      end
      j = j + 1
   end
   i = i + 1
end

end

function love.mousepressed(x, y, button)
end

function love.keypressed(k)
end

function love.quit()
end
