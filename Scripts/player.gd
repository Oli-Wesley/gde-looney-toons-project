extends CharacterBody2D


@export var SPEED: float = 250.0
@export var JUMP_VELOCITY: float = -400.0
@export var KYOTE_TIME: float = 0.1
@export var time_since_grounded: float = 0.0


func _process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		time_since_grounded += delta
	elif is_on_floor():
		time_since_grounded = 0.0
	
	# Handle jump.
	if Input.is_action_just_pressed("Move_jump") and time_since_grounded <= KYOTE_TIME:
		velocity.y = JUMP_VELOCITY
		time_since_grounded = KYOTE_TIME +1 #set it to more than the kyote time on jump, so can't jump twice without re-grounding

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_left", "Move_right")
	if direction:
		velocity.x = direction * SPEED * delta * 60
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
