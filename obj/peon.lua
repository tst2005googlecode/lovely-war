peon = class('peon', baseObj)

function peon:initialize(x, y, team)
   baseObj.initialize(self, x, y, 100, team, 1)
end

function peon:keyPress(b)

end

function peon:goTo(x, y)
   if map[x][y] == 1 then
      self.move = true
      self.patrol = false
--      pather = Jumper(map, 0, true)
--     pather:setHeuristic('DIAGONAL')

      self.g_x = x
      self.g_y = y
      print("SEARCH")
      self.goto = pather:searchPath(self.x, self.y, x, y)
      print("END SEARCH")
      if self.goto ~= nil and #self.goto > 1 then
	 print(self.goto[1].x, self.goto[1].y)
	 print("SMOO")
	 self.goto = pather:smooth(self.goto)
	 print("END SMOOO")
	 table.remove(self.goto, 1)
      else
	 self.move = false
      end
   end
end

function peon:update(dt)
   if self.move then
      if self.goto ~= nil and #self.goto > 0 then
	 local a = self.goto[1]
	 if map[a.x][a.y] == 1 then
	    self:setPos(a.x, a.y)
	    table.remove(self.goto, 1)
	 else
	    self:goTo(self.g_x, self.g_y)
	 end
      end
   end
end

function peon:die()
   baseObj.die(self)
end

function peon:takeDamage(dam)
   baseObj.takeDamage(self, dam)
end

function peon:draw()
   love.graphics.setColor( 30, 70, 255)
   love.graphics.rectangle("fill", self.x * TILE_X, self.y * TILE_Y, TILE_X, TILE_Y)
   if self.goto ~= nil then
      for x,y in ipairs(self.goto) do
	 love.graphics.setColor( 155, 255, 150)
--	 love.graphics.rectangle("fill", y.x * TILE_X, y.y * TILE_Y, TILE_X, TILE_Y)
      end
   end
end