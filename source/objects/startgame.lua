startgame = Object:extend()

function startgame:new()
	self.area = Area()
	self.timer = Timer()
	
	newSprite = {}
	newSprite = sodapop.newAnimatedSprite(0,0)
	newSprite:addAnimation('idle', {
		image = love.graphics.newImage 'resources/bb_idle_01.png',
		frameWidth = 128,
		frameHeight = 128,
		frames = {
		{1,1,1,1,1}
		},
	})
	newSprite:addAnimation('walk', {
		image = love.graphics.newImage 'resources/bb_walk_sheet.png',
		frameWidth = 128,
		frameHeight = 128,
		frames = {
		{1,1,2,1,.2},
		},
	})

	player1 = self.area:addGameObject('Entity', 300, 300, {
		player = true, 
		sprite = newSprite
	})

	curDir = 0
end

function startgame:update(dt)
	self.area:update(dt)
	self.timer:update(dt)

	if love.keyboard.isDown('left') then
		if curDir ~= -1 then player1.sprite:switch 'walk' end
		player1.sprite.flipX = true
		player1.x = player1.x - 1
		curDir = -1
	end
	if love.keyboard.isDown('right') then
		if curDir ~= 1 then player1.sprite:switch 'walk' end
		player1.sprite.flipX = false
		player1.x = player1.x + 1
		curDir = 1
	end
	if not love.keyboard.isDown('left') and not love.keyboard.isDown('right')
	then
		player1.sprite:switch 'idle'
		curDir = 0
	end
end

function startgame:draw()
	self.area:draw()
end
