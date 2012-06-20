greatHall = class('greatHall', baseObj)

function greatHall:initialize(x, y, team)
   baseObj.initialize(self, x, y, 1200, team, 1)
end

function greatHall:setPos(x, y)
   baseObj.setPos(self, x, y)
end

function greatHall:die()
   baseObj.die(self)
end

function greatHall:takeDamage(dam)
   baseObj.takeDamage(self, dam)
end

function greatHall:draw()
   love.graphics.setColor(255, 40, 100)
   love.graphics.rectangle("fill", self.x * TILE_X, self.y * TILE_Y, TILE_X, TILE_Y)

end