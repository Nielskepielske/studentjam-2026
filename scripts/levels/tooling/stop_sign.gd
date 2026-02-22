extends Area2D

## Item om het einde van een level te signaleren. Afbeelding is tuurlijk placeholder

signal end_of_level_reached

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("end_of_level_reached")
