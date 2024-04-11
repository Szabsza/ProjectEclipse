extends Node

signal exited()
signal shop_updated()

var is_shop_visible : bool = false
var shop_items : Array = []


func setup(shop_items : Array):
	self.shop_items = shop_items;
	shop_updated.emit()


func set_shop_visible():
	is_shop_visible = true
	

func set_shop_invisible():
	is_shop_visible = false
