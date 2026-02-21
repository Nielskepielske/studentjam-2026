extends Control

@onready var name_input: LineEdit = $Panel/VBoxContainer/Name_input
@onready var button: Button = $Panel/VBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if name_input.text != "":
		button.disabled = false
	else:
		button.disabled = true


func _on_start_pressed() -> void:
	PlayerData.player_name = name_input.text
	get_tree().change_scene_to_file("res://scenes/levels/tutorial.tscn")
