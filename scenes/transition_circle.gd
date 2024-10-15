extends ColorRect

@onready var shader: ShaderMaterial = self.material

var lerp_start_size = 0.0
var lerp_end_size = 2.0
var lerp_duration = 1.0  # How long the lerp takes (in seconds)
var elapsed_time = 0.0  # To track time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent().get_parent().has_node("God"): 
		var player: God = get_parent().get_parent().get_node("God")
		shader.set_shader_parameter("circle_position", player.position)
	else:
		print("Error Transition Cirlce: Could not find Player (God) Node")
	shader.set_shader_parameter("circle_size", 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time += delta
	var lerp_factor = clamp(elapsed_time / lerp_duration, 0.0, 1.0)
	var new_circle_size = lerp(lerp_start_size, lerp_end_size, lerp_factor)
	shader.set_shader_parameter("circle_size", new_circle_size)
