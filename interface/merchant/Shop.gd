class_name Shop extends Control	

signal exited()

@onready var merchant_label : Label = $VBoxContainer/MerchantLabel
@onready var displayed_shop_item : ShopItemPanel = $VBoxContainer/ShopItems/ShopItemPanel

var current_item_index : int = 0
var shop_items : Array[ShopItem] = []


func update_current_item():
	displayed_shop_item.set_item(shop_items[current_item_index])


func setup(merchant_name : String, shop_items : Array[ShopItem]):
	merchant_label.text = merchant_name
	self.shop_items = shop_items
	
	if len(shop_items) > 0:
		update_current_item()


func _ready():
	visible = false
	

func _on_left_button_pressed():
	if (current_item_index <= 0):
		current_item_index = len(shop_items) - 1 
	else:
		current_item_index -= 1
		
	update_current_item()
	

func _on_right_button_pressed():
	if (current_item_index >= len(shop_items) - 1):
		current_item_index = 0
	else:
		current_item_index += 1
		
	update_current_item()
	

func _on_buy_button_pressed():           
	if (PlayerManager.player_data.runes_held.amount >= shop_items[current_item_index].cost):
		PlayerManager.player_data.runes_held.decrease_runes(shop_items[current_item_index].cost)
		shop_items[current_item_index].on_buy()
		var index_to_delete = current_item_index
		_on_right_button_pressed()
		shop_items.pop_at(index_to_delete)


func _on_leave_button_pressed():
	visible = false
	exited.emit()
