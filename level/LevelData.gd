class_name LevelData extends Resource

@export var level_name : String = "Level"
@export var level_scene_path : String = ""

@export var chests_data : Array[ChestData]
@export var checkpoints_data : Array[CheckpointData]
@export var merchants_data : Array[MerchantData]
@export var chest_loots : Array[LootItem]
#@export var door_data : Array[DoorData]


func set_level_name(level_name : String):
	self.level_name = level_name


func set_level_scene_path(level_scene_path : String):
	self.level_scene_path = level_scene_path


func add_chest(chest_data : ChestData):
	chests_data.append(chest_data)


func add_checkpoint(checkpoint_data : CheckpointData):
	checkpoints_data.append(checkpoint_data)
	

func add_merchant(merchant_data : MerchantData):
	merchants_data.append(merchant_data)


func add_chest_loot(chest_loot : LootItem):
	chest_loots.append(chest_loot)


#func add_door(door_data : DoorData):
	#doors_data.append(door_data)


func reset_all():
	chests_data = []
	chest_loots = []
	checkpoints_data = []
	merchants_data = []
	#door_data = []