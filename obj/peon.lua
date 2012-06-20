peon = class('peon', baseObj)

function peon:initialize(x, y, team)
   baseObj.initialize(self, x, y, 100, team, 1)
end

function peon:goTo(x, y)
   if map[x][y] == 0 then
      self.move = true
      self.g_x = x
      self.g_y = y
      local pather = Jumper(map, 0, true)
      self.goto = pather:searchPath(self.x, self.y, x, y)
      if self.goto ~= nil then
	 self.goto = pather:smooth(self.goto)
	 table.remove(self.goto, 1)
      end
   end
end

function peon:update(dt)
   if self.move then
      if self.goto ~= nil and #self.goto > 0 then
	 local a = self.goto[1]
	 if map[a.x][a.y] == 0 then
	    self:setPos(a.x, a.y)
	    table.remove(self.goto, 1)
	 else
	    self:goTo(self.g_x, self.g_y)
--	    self:update(dt)
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
end