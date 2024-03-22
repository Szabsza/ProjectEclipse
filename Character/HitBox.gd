class_name HitBox extends Area2D

var damage : int = 0


func setup(damage : int, layer: int, mask: int):
	collision_layer = layer
	collision_mask = mask
	
	self.damage = damage
