extends Node2D

## HHow much wiggle rotation
@export var wiggle_intensity := 5
## Distance the plaform should falldown (negative values moves platform up)
@export var fall_distance := 10 
## Time until the platform starts falling down
@export var time_until_fall := 0.1
## How long should it take the platform to fall down and disappear
@export var fall_duration := 0.2

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body is not God: return
	# start timer for how long the platform holds before breaking
	await get_tree().create_timer(time_until_fall).timeout.connect(_fall)
	
	# play wiggel animation to indicate the plafform is boken (or tween maybee)
	await get_tree().create_tween().tween_property(self, "rotation_degrees", -wiggle_intensity, 0.1).finished
	await get_tree().create_tween().tween_property(self, "rotation_degrees", wiggle_intensity, 0.2).finished
	await get_tree().create_tween().tween_property(self, "rotation_degrees", -wiggle_intensity, 0.1).finished
	await get_tree().create_tween().tween_property(self, "rotation_degrees", wiggle_intensity, 0.2).finished
	await get_tree().create_tween().tween_property(self, "rotation_degrees", 0, 0.1).finished

func _fall() -> void:
	# fall down
	get_tree().create_tween().tween_property(self, "position", position - Vector2(0, -fall_distance), fall_duration)
	# fade and disappear
	await get_tree().create_tween().tween_property(self, "modulate:a", 0, fall_duration).finished
	# remove from existance
	queue_free()
