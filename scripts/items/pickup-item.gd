extends Area2D

@export var inv: Inventory
var player = null
var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if inv:
		inv = inv.duplicate()
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range:
		pick_up()
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = true
		player = body

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = false
		player = null


## Player picks up the an item from the ground
func pick_up() -> void:
	if inv and inv.item:
		player.collect_item(inv.item)
		inv.item = null
