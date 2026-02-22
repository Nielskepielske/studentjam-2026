extends Area2D

signal player_hit_dialogue_trigger(filepath : String)
@export var single_use : bool = true
@export_file("*.txt") var filepath : String

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("player_hit_dialogue_trigger", filepath)
		if single_use:
			queue_free()
