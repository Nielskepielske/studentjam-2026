extends Control
@onready var lbl_name: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer/lblName
@onready var lbl_drunkness: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer2/Panel/lblDrunkness
@onready var lbl_score: Label = $CanvasLayer/MarginContainer/HBoxContainer/HBoxContainer2/Panel2/lblScore
@onready var timer: Timer = $Timer
@onready var pukebar: TextureProgressBar = $CanvasLayer/MarginContainer2/VBoxContainer/Control/pukebar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lbl_name.text = PlayerData.player_name
	lbl_drunkness.text = str(DrunkenMovement.drunkAmount)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lbl_drunkness.text = str(Globals.DRUNK)
	lbl_drunkness.text = str(DrunkenMovement.drunkAmount)
	pukebar.value = PlayerData.naussea_level
	print("pukebar: ",pukebar.value)


func _on_timer_timeout() -> void:
	#pukebar.value = pukebar.value + 0.5
	pass
