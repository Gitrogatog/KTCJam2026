extends CharacterBody2D

const WALK_SPEED = 300.0
const ACCELERATION_SPEED = WALK_SPEED * 6.0
const JUMP_VELOCITY = -725.0
## Maximum speed at which the player can fall.
const TERMINAL_VELOCITY = 700

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var horizontal := bool_to_axis(Input.is_action_pressed("left"), Input.is_action_pressed("right"))
	var vertical := bool_to_axis(Input.is_action_pressed("up"), Input.is_action_pressed("down"))
	var hold_shoot := Input.is_action_pressed("shoot")
	var begin_shoot := Input.is_action_just_pressed("shoot")
	var begin_jump := Input.is_action_just_pressed("jump")
	if is_on_floor():
		if begin_jump:
			velocity.y = JUMP_VELOCITY
		else:
			velocity.y = minf(0, velocity.y + get_gravity().y * delta)
	else:
		velocity.y = minf(TERMINAL_VELOCITY, velocity.y + get_gravity().y * delta)
	#velocity = Vector2(horizontal, vertical).normalized()
	pass
	
func _physics_process(delta: float) -> void:
	move_and_slide()

func bool_to_axis(negative: bool, positive: bool) -> float:
	if negative == positive:
		return 0
	if negative:
		return -1
	return 1
