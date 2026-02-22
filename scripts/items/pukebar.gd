extends TextureProgressBar

func _ready():
	max_value = 100
	value = 0

func fill_to(target_value: float, duration: float):
	var tween = create_tween()
	tween.tween_property(self, "value", target_value, duration)
