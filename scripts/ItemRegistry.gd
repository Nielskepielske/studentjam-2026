extends Node

## Lijst van items die preloaded worden. 
## Ge gebruikt de name van een InvItem om ze te getten
const ITEMS = {
	"WaterBottle": preload("res://scenes/items/water_bottle.tscn"),
	"EnergyBottle": preload("res://scenes/items/energy_bottle.tscn")
}

## Instantiates an inventory item's scene
func instantiate(item: InvItem) -> Node:
	var scene = ITEMS.get(item.name)
	if not scene:
		push_error("No scene exists for item: "+ item.name)
		return null
	var instance = scene.instantiate()
	instance.inv.item = item
	return instance
