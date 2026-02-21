extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setup_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _setup_level()->void:
	var enemies = $".".get_node_or_null("Enemies")
			
	var bottles = $".".get_node_or_null("Bottles")
	if bottles:
		for item in bottles.get_children():
			item.player_hit_drink.connect(_on_player_hit_alcohol)
			
	

#
# Signal handling
#

## Player interacts with alcohol obstacle
func _on_player_hit_alcohol(body:Node2D, alcohol: int)-> void:
	Globals.add_to_drunk_state(alcohol)
	
	
