extends Node

var DRUNK = 0
const MAX_VELOCITY = 400.0
const MAX_JUMP_VELOCITY = 400.0
var CURRENT_ACCELERATION = 20.0

func add_to_drunk_state(alcohol :int) -> void:
	if DRUNK < 100:
		DRUNK = min(100, DRUNK + alcohol)
	
