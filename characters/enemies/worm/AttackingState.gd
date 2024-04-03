class_name WormAttackingState extends State

const ATTACK_ANIMATION : String = "attack"


func on_enter():
	playback.travel(ATTACK_ANIMATION)


