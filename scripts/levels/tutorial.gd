extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var camera_2d: Camera2D = $Camera2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var screen_overlay: Control = $"Screen overlay"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.add_to_drunk_state(40)
	audio_stream_player.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	camera_2d.position.x = player.position.x


func _on_stop_sign_end_of_level_reached() -> void:
	# display story text ofzo, idk
	# swith naar ander level ipv main menu
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")


func _on_dialogue_trigger_player_hit_dialogue_trigger(filepath: String) -> void:
	print("dialogue start in tutorial")
	screen_overlay.on_dialogue_start(filepath)
