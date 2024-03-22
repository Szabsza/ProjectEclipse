class_name HurtBox extends Area2D


func setup(layer : int, mask : int):
	collision_layer = layer
	collision_mask = mask


func _ready():
	connect("area_entered", self._on_area_entered)


func _on_area_entered(hitbox : HitBox):
	if hitbox == null:
		return
	
	print(hitbox.name)
	
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
		
	if owner.has_method("knock_back"):
		owner.knock_back(hitbox.global_position)
	
