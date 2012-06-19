peon = class('peon', baseObj)

function peon:initialize(x, y, life, team)
   baseObj.initialize(self, x, y, life, team)
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