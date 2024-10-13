class_name Player

extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -500.0

@export var follower: Ghost
var positions := []
var delay_time := 3.0
var step_time := 0.05

func _ready() -> void:
	set_process(true)
	await get_tree().create_timer(delay_time).timeout

func _process(delta: float) -> void:
	
	if positions.size() == 0 or (positions.size() > 0 and positions[-1] != global_position):
		positions.append(global_position)
	
	if positions.size() > int(delay_time / step_time):
		follower.global_position = positions.pop_front()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("down") and is_on_floor():
		set_collision_mask_value(1, false)
		await get_tree().create_timer(0.1).timeout
		set_collision_mask_value(1, true)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
