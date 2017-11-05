startup = Object:extend()

function startup:new()
	self.area = Area()
	self.timer = Timer()
end

function startup:update(dt)
	self.area:update(dt)
	self.timer:update(dt)
end

function startup:draw()
	self.area:draw()
end
