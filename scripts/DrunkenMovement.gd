extends Node

var drunkAmount = 0
var currentSpeed = 0
var currentJumpSpeed = 0
var stunned = false

var timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drunkAmount = Globals.DRUNK
	currentSpeed = Globals.MAX_VELOCITY
	currentJumpSpeed = Globals.MAX_JUMP_VELOCITY
	
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = Globals.STUN_TIME
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !stunned:
		checkStun()
		calculateCurrentSpeed(delta)
	else:
		stun()
	
	
func calculateCurrentSpeed(delta: float) -> void:
	#currentSpeed = min(Globals.MAX_VELOCITY, Globals.MAX_VELOCITY * (1 - drunkAmount/Globals.MAX_DRUNKNESS)) * delta
	#currentJumpSpeed = min(Globals.MAX_JUMP_VELOCITY, Globals.MAX_JUMP_VELOCITY * (1 - drunkAmount/Globals.MAX_DRUNKNESS)) * delta
	currentSpeed = min(Globals.MAX_VELOCITY, Globals.MAX_VELOCITY * (Globals.MAX_VELOCITY /(12 * drunkAmount)))
	currentJumpSpeed = min(Globals.MAX_JUMP_VELOCITY, Globals.MAX_JUMP_VELOCITY -  drunkAmount)
	
func checkStun() -> void:
	if PlayerData.naussea_level >= 100 and !stunned:
		stunned = true
		timer.start()

func stun() -> void:
	currentJumpSpeed = 0
	currentSpeed = 0
		
func _on_timer_timout() -> void:
	PlayerData.reset_naussea()
	stunned = false
	
func remove_from_drunk(val: float)->void:
	drunkAmount = max(0, drunkAmount - val)
