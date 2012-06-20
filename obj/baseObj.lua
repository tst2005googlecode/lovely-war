baseObj = class('baseObj')

function baseObj:initialize(x, y, life, team, size)
   self.x = x
   self.y = y
   self.g_x = 0
   self.g_y = 0
   self.move = false
   self.size = size
   self.team = team
   self.life = life
   self.goto = {}
   table.insert(objects, self)
   map[x][y] = self
end

function baseObj:update(dt)
end

function baseObj:goTo(x, y)
end

function baseObj:setPos(x, y)
   map[self.x][self.y] = 0
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