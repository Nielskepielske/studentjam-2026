extends Control
@onready var lbl_name: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer/lblName
@onready var lbl_drunkness: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer2/Panel/lblDrunkness
@onready var lbl_score: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer2/Panel2/lblScore
@onready var pukebar: TextureProgressBar = $CanvasLayer/MarginContainer2/VBoxContainer/Panel/pukebar
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lbl_name.text = PlayerData.player_name
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lbl_drunkness.text = str(Globals.DRUNK)


func _on_timer_timeout() -> void:
	pukebar.value = pukebar.value + 0.5
