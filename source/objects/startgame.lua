startgame = Object:extend()

function startgame:new()
	self.area = Area()
	self.timer = Timer()
	
	player = {}

	player.sprite = sodapop.newAnimatedSprite(0, 0)
	player.sprite:addAnimation('walk', {
		image = love.graphics.newImage 'resources/bb_walk_sheet.png',
		frameWidth = 32,
		frameHeight = 32,
		frames = {
		{1,1,2,1,.2},
		},
	})

	self.area:addGameObject('PlayerObject', 384, 324, player)
end

function startgame:update(dt)
	self.area:update(dt)
	self.timer:update(dt)
end

function startgame:draw()
	self.area:draw()
end
