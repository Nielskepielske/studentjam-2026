extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var inventory: Inventory
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	set_animation()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		audio_stream_player_2d.play()
		var vel = calc_jump(Globals.MAX_JUMP_VELOCITY)
		velocity.y = -vel
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	var drunk_speed = calc_speed(Globals.MAX_VELOCITY)
	if direction:
		velocity.x = direction * drunk_speed
	else:
		velocity.x = move_toward(velocity.x, 0, drunk_speed)
	move_and_slide()
	if direction < 0: 
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
		
	# handle drop
	if Input.is_action_just_pressed("drop_item"):
		drop_item()
		
	if Input.is_action_just_pressed("use_item"):
		use_item()

func set_animation():
	if velocity.y > 1:
		animated_sprite_2d.animation = "falling"
	elif velocity.y < -1:
		animated_sprite_2d.animation = "jumping"
	elif velocity.x < -1 or velocity.x > 1:
		animated_sprite_2d.animation = "running"
	else: 
		animated_sprite_2d.animation = "idle"

func collect_item(item : InvItem):
	print("picked up item")
	print(item)
	if inventory.item:
		drop_item()
	inventory.item = item
	print("inv item is now " + inventory.item.name)
	
func drop_item():
	print("dropping item")
	if not inventory or not inventory.item:
		return null
	var instance = ItemRegistry.instantiate(inventory.item)
	if instance:
		instance.position = global_position + Vector2(0, 0)
		get_parent().add_child(instance)
	inventory.item = null

func use_item():
	print("use item")
	if not inventory or not inventory.item:
		return null
	inventory.item.behavior.use($".")


func calc_speed(vel : float) -> float:
	var y = vel * vel / (12*Globals.DRUNK)
	return min(vel, y)
	
func calc_jump(vel : float) -> float:
	var y = vel - Globals.DRUNK
	return min(vel, y)
