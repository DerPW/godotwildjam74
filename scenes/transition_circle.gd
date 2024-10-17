extends ColorRect

@onready var shader: ShaderMaterial = self.material

var circle_closed = 0.0
var circle_open = 2.0
var anim_duration = 1.0 

func _ready() -> void:
	_reset_circle()

func _reset_circle():
	shader.set_shader_parameter("circle_size", circle_closed)

func _get_player_mapped_position() -> Vector2:
	if get_parent().get_parent().get_node("World").has_node("God"): 
		var player: God = get_parent().get_parent().get_node("World").get_node("God")
		var mapped = Vector2(player.position.x / 576, player.position.y / 324)
		return mapped
	else:
		print("Error Transition Cirlce: Could not find Player (God) Node")
		return Vector2(-1, -1)
	

func _on_level_loader_level_started() -> void:
	shader.set_shader_parameter("circle_position", _get_player_mapped_position())
	var tween := get_tree().create_tween()
	tween.tween_property(shader, "shader_parameter/circle_size", circle_open, anim_duration)


func _on_level_loader_level_ended() -> void:
	var player_pos = _get_player_mapped_position()
	#player_pos.x += 0.02
	shader.set_shader_parameter("circle_position", player_pos)
	var tween := get_tree().create_tween()
	tween.tween_property(shader, "shader_parameter/circle_size", circle_closed, anim_duration)
