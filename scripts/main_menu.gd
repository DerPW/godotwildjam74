extends Control

const MAIN = preload("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var circle := $CanvasLayer/TransitionCircle.material as ShaderMaterial
	#circle.set_shader_parameter("circle_size", 0)
	var tween := get_tree().create_tween()
	tween.tween_property(circle, "shader_parameter/circle_size", 2, 1)

func _load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)


func _on_button_pressed() -> void:
	var circle := $CanvasLayer/TransitionCircle.material as ShaderMaterial
	var tween := get_tree().create_tween()
	tween.tween_property(circle, "shader_parameter/circle_size", 0, 1)
	# wait for circle to close
	await get_tree().create_timer(1).timeout
	_load_main_scene()
