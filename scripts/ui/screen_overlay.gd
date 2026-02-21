extends Control

@export var empty_texture : Texture2D

@onready var lbl_name: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer/lblName
@onready var lbl_drunkness: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer2/Panel/lblDrunkness
@onready var lbl_score: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer2/Panel2/lblScore
@onready var held_item: TextureRect = $CanvasLayer/MarginContainer2/HBoxContainer/HBoxContainer/Panel/held_item
@onready var timer: Timer = $Timer
@onready var pukebar: TextureProgressBar = $CanvasLayer/MarginContainer2/VBoxContainer/Control/pukebar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lbl_name.text = PlayerData.player_name
	lbl_drunkness.text = str(DrunkenMovement.drunkAmount)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lbl_drunkness.text = str(DrunkenMovement.drunkAmount)
	pukebar.value = PlayerData.naussea_level
	print("pukebar: ",pukebar.value)
	if PlayerData.held_item != held_item.texture:
		if PlayerData.held_item:
			held_item.texture = PlayerData.held_item
		else:
			held_item.texture = empty_texture

func _on_timer_timeout() -> void:
	#pukebar.value = pukebar.value + 0.5
	pass
