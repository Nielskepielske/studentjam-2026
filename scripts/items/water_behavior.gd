class_name WaterBehavior
extends ItemBehavior

var value : float = 0.1
func use(player:Node)->void:
	DrunkenMovement.remove_from_drunk(value)
