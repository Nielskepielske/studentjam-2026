extends Node

var DRUNK = 0
const MAX_VELOCITY = 400.0
const MAX_JUMP_VELOCITY = 800.0
var CURRENT_ACCELERATION = 20.0
const MAX_DRUNKNESS = 4.0
const NAUSSEA_JUMP = 20
const NAUSSEA_MOVE = 3
const NAUSSEA_IDLE = 1
const STUN_TIME = 2

func add_to_drunk_state(alcohol :int) -> void:
	DRUNK = min(100, DRUNK + alcohol)
	
func remove_from_drunk_with_water():
	DRUNK = max(0, DRUNK - 20)
	
