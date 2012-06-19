baseObj = class('baseObj')

function baseObj:initialize(x, y, life, team)
   self.x = x
   self.y = y
   self.team = team
   self.life = life
   table.insert(objects, self)
   map[x][y] = self
end

function baseObj:setPos(x, y)
   map[x][y] = 0
   self.x = x
   self.y = y
   map[x][y] = self
end

function baseObj:debug()
   print("X : " .. self.x .. " | Y : " .. self.y)
end

function baseObj:die()
   table.remove(objects, self)
   map[self.x][self.y] = 0
end

function baseObj:takeDamage(dam)
   self.life = self.life - dam
   if self.life <= 0 then self:die() end
end