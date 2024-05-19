extends Node2D

var save_path : String = "user://game.save"
var save_data : SaveData


func load_save_data():
	save_data = SaveData.new()
	save_data.player_data = PlayerManager.player.player_data
	save_data.player_health = PlayerManager.player.health
	save_data.player_mana = PlayerManager.player.mana
	save_data.player_stamina = PlayerManager.player.stamina
	save_data.player_runes_held = PlayerManager.player.runes_held
	save_data.player_status = PlayerManager.player.status
	save_data.health_potions = HotBarManager.health_potion
	save_data.mana_potion = HotBarManager.mana_potion
	save_data.bracelet = HotBarManager.bracelet
	save_data.necklace = HotBarManager.necklace
	save_data.wings = HotBarManager.wings
	#save_data.shop_items = 

# Merchant
@export var shop_items : Array[ShopItem]

# Checkpoints
@export var checkpoints_data : Array[CheckpointData]

# Chest
@export var chests_data : Array[ChestData]

func save_game():
	pass
