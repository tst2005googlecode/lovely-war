objects = {}

MAP_X = 125
MAP_Y = 125

TILE_X = 32
TILE_Y = 32

map = {}

local i = 1
while i < MAP_X do
   map[i] = {}
   local j = 1
   while j < MAP_Y do
      map[i][j] = 0
      j = j + 1
   end
   i = i + 1
end

require('obj/baseObj')
require('obj/peon')
require('obj/greatHall')