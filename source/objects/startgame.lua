startgame = Object:extend()

function startgame:new()
	self.area = Area()
	self.timer = Timer()
	
	player0 = {}

	player0.sprite = sodapop.newAnimatedSprite(0,0)
	player0.sprite:addAnimation('walk', {
		image = love.graphics.newImage 'resources/bb_walk_sheet.png',
		frameWidth = 128,
		frameHeight = 128,
		frames = {
		{1,1,2,1,.2},
		},
	})

	self.area:addGameObject('Entity', 300, 300, {player = true, sprite = player0.sprite})
end

function startgame:update(dt)
	self.area:update(dt)
	self.timer:update(dt)
end

function startgame:draw()
	self.area:draw()
end
