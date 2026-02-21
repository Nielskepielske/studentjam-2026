extends Control
@onready var lbl_name: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer/lblName
@onready var lbl_drunkness: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer2/Panel/lblDrunkness
@onready var lbl_score: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer2/Panel2/lblScore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lbl_name.text = PlayerData.player_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lbl_drunkness.text = str(Globals.DRUNK)
