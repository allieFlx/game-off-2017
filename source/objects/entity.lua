require 'objects/gameobject'

Entity = GameObject:extend()

function Entity:new(area, x, y, player, sprite, opts)
	Entity.super.new(self, area, x, y, opts)
end

function Entity:update(dt)
	Entity.super.update(self,dt)
end

function Entity:draw()
	self.sprite:draw()
end
