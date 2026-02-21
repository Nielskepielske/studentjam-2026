extends Area2D

var drunkValue : float = 0.03 * 15

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		DrunkenMovement.drunkAmount += drunkValue
		queue_free()
