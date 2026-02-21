class_name WaterBehavior
extends ItemBehavior

func use(player:Node)->void:
	print("drinking water")
	print(player)
	Globals.remove_from_drunk_with_water()
