require 'objects/gameobject'

Entity = GameObject:extend()

function Entity:new(area, x, y, opts)
	Entity.super.new(self, area, x, y, opts)
	self.player = opts.player
	self.sprite = opts.sprite
end

function Entity:update(dt)
	Entity.super.update(self,dt)
	self.sprite.x, self.sprite.y = self.x, self.y
	self.sprite:update(dt)
end

function Entity:draw()
	self.sprite:draw()
end
