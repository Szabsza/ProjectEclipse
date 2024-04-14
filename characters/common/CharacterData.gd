class_name CharacterData extends Resource

enum CharacterType { PLAYER, ENEMY, NPC }

@export var character_name : String
@export var character_type : CharacterType

@export var global_position : Vector2
