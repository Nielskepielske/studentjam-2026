extends Node

var player_name: String = "Player"
var naussea_level: float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update_naussea(amount: int) -> void:
	naussea_level = naussea_level + amount * 0.1 * DrunkenMovement.drunkAmount
	print("naussea: " ,naussea_level)
	
func reset_naussea() -> void:
	naussea_level = 0
