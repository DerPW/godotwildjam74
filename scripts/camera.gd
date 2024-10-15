extends Camera2D

@export var follow_speed: float = 5.0  # Adjust this value for the desired smoothness
@export var pos_offset: Vector2 = Vector2.ZERO  # pos_offset from the player, if any

# Reference to the player node (you can set this in the inspector or by code)
@export var player: Node2D

func _process(delta: float) -> void:
	if player:
		# Get the player's position and apply an pos_offset if needed
		var target_position: Vector2 = player.global_position + pos_offset
		
		# Smoothly interpolate towards the player's position
		position = position.lerp(target_position, follow_speed * delta)
