startup = Object:extend()

function startup:new()
	self.area = Area()
	self.timer = Timer()

	title = love.graphics.newImage 'resources/title_screen.png'
end

function startup:keypressed(key)
	goToRoom('startgame')
end

function startup:update(dt)
	self.area:update(dt)
	self.timer:update(dt)
end

function startup:draw()
	love.graphics.draw(title,0,0)
	love.graphics.print('PRESS ANY KEY TO START', 320, 450)
	self.area:draw()
end
