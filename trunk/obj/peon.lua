peon = class('peon', baseObj)

function peon:initialize(x, y, team)
   baseObj.initialize(self, x, y, 100, team, 1)
end

function peon:setPos(x, y)
   baseObj.setPos(self, x, y)
end

function peon:die()
   baseObj.die(self)
end

function peon:takeDamage(dam)
   baseObj.takeDamage(self, dam)
end

function peon:draw()
   love.graphics.rectangle("fill", self.x * TILE_X, self.y * TILE_Y, TILE_X, TILE_Y)
end