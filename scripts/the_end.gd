extends Control

var main_menu := load("res://scenes/main_menu.tscn")

func _ready() -> void:
	var circle := $CanvasLayer/TransitionCircle.material as ShaderMaterial
	#circle.set_shader_parameter("circle_size", 0)
	var tween := get_tree().create_tween()
	tween.tween_property(circle, "shader_parameter/circle_size", 2, 1)

func _load_main_menu_scene() -> void:
	get_tree().change_scene_to_packed(main_menu)


func _on_button_pressed() -> void:
	var circle := $CanvasLayer/TransitionCircle.material as ShaderMaterial
	var tween := get_tree().create_tween()
	tween.tween_property(circle, "shader_parameter/circle_size", 0, 1)
	# wait for circle to close
	await get_tree().create_timer(1).timeout
	_load_main_menu_scene()
