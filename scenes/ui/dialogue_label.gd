extends Control

@onready var label: Label = $Button/Label
@onready var next_button: Button = $Button

var lines: PackedStringArray = []
var current_line : int = 0

func _ready() -> void:
	hide()

func init_dialogue(filepath : String) -> void:
	lines = FileAccess.open(filepath, FileAccess.READ).get_as_text().split("\n", false)
	current_line = 0
	show()
	_display_next_line()

func _display_next_line()->void:
	while current_line < lines.size():
		label.text = lines[current_line]
		print("line:" + lines[current_line])
		current_line += 1
		await next_button.pressed
	hide()
