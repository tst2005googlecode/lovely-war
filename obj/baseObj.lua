baseObj = class('baseObj')

function baseObj:initialize(x, y)
   self.x = x
   self.y = y
end

function baseObj:setPos(x, y)
   self.x = x
   self.y = y
end

function baseObj:debug()
   print("X : " .. self.x .. " | Y : " .. self.y)
end