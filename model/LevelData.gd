class_name LevelData extends Resource

@export var level_name : String = "Level"
@export var level_scene_path : String = ""

@export var chests_data : Array[ChestData]
@export var checkpoints_data : Array[CheckpointData]
@export var merchants_data : Array[MerchantData]
@export var chest_loots : Array[LootItem]
@export var doors_data : Array[DoorData]
@export var remains_data : RemainsData


func set_level_name(level_name : String):
	self.level_name = level_name


func set_level_scene_path(level_scene_path : String):
	self.level_scene_path = level_scene_path


func set_remains_data(remains_data : RemainsData):
	self.remains_data = remains_data  


func add_chest(chest_data : ChestData):
	chests_data.append(chest_data)


func add_checkpoint(checkpoint_data : CheckpointData):
	checkpoints_data.append(checkpoint_data)
	

func add_merchant(merchant_data : MerchantData):
	merchants_data.append(merchant_data)


func add_chest_loot(chest_loot : LootItem):
	chest_loots.append(chest_loot)


func add_door(door_data : DoorData):
	doors_data.append(door_data)


func reset_all():
	chests_data = []
	chest_loots = []
	checkpoints_data = []
	merchants_data = []
	doors_data = []
	remains_data = null


func load_data(level_data : Dictionary):
	level_name = level_data["level_name"]
	level_scene_path = level_data["level_scene_path"]

	chests_data = []
	for data in level_data["chests_data"]:
		var _chest_data = ChestData.new()
		_chest_data.load_data(data)
		chests_data.append(_chest_data)
		
	checkpoints_data = []
	for data in level_data["checkpoints_data"]:
		var _checkpoint_data = CheckpointData.new()
		_checkpoint_data.load_data(data)
		checkpoints_data.append(_checkpoint_data)
		
	merchants_data = []
	for data in level_data["merchants_data"]:
		var _merchant_data = MerchantData.new()
		_merchant_data.load_data(data)
		merchants_data.append(_merchant_data)
		
	chest_loots = []
	for data in level_data["chest_loots"]:
		var _chest_loot = LootItem.new()
		_chest_loot.load_data(data)
		chest_loots.append(_chest_loot)
		
	doors_data = []
	for data in level_data["doors_data"]:
		var _door_data = DoorData.new()
		_door_data.load_data(data)
		doors_data.append(_door_data)
	
	if level_data["remains_data"].is_empty():
		remains_data = null
	else:
		var _remains_data = RemainsData.new()
		_remains_data.load_data(level_data["remains_data"])
		remains_data = _remains_data


func to_save() -> Dictionary:
	var _chests_data = []
	for data in chests_data:
		_chests_data.append(data.to_save())
	
	var _checkpoints_data = []
	for data in checkpoints_data:
		_checkpoints_data.append(data.to_save())
	
	var _merchants_data = []
	for data in merchants_data:
		_merchants_data.append(data.to_save())
	
	var _chest_loots = []
	for data in chest_loots:
		_chest_loots.append(data.to_save())
	
	var _doors_data = []
	for data in doors_data:
		_doors_data.append(data.to_save())
	
	
	return {
		"level_name" : level_name,
		"level_scene_path" : level_scene_path,
		"chests_data" : _chests_data,
		"checkpoints_data" : _checkpoints_data,
		"merchants_data" : _merchants_data,
		"chest_loots" : _chest_loots,
		"doors_data" : _doors_data,
		"remains_data" : remains_data.to_save() if remains_data else {}
	}
