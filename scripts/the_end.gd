extends Control

var main_menu := load("res://scenes/main_menu.tscn")
@onready var speedrun_time: Label = $Panel/SpeedrunLabel/SpeedrunTime
@onready var speedrun_label: VBoxContainer = $Panel/SpeedrunLabel

func _ready() -> void:
	var circle := $CanvasLayer/TransitionCircle.material as ShaderMaterial
	#circle.set_shader_parameter("circle_size", 0)
	var tween := get_tree().create_tween()
	tween.tween_property(circle, "shader_parameter/circle_size", 2, 1)
	SpeedRunTimer.stop_timer()
	speedrun_time.text = "%02d:%02d.%03d" % [SpeedRunTimer.minutes, SpeedRunTimer.seconds, SpeedRunTimer.msec]
	
	var label_tween := get_tree().create_tween()
	
	label_tween.set_ease(Tween.EASE_IN_OUT)
	label_tween.tween_property(
		speedrun_label, ^"scale", Vector2(1.05, 1.05), 0.5
	)
	label_tween.tween_property(speedrun_label, ^"scale", Vector2(1.0, 1.0), 0.5)
	label_tween.set_loops()
	

func _load_main_menu_scene() -> void:
	get_tree().change_scene_to_packed(main_menu)


func _on_button_pressed() -> void:
	var circle := $CanvasLayer/TransitionCircle.material as ShaderMaterial
	var tween := get_tree().create_tween()
	tween.tween_property(circle, "shader_parameter/circle_size", 0, 1)
	# wait for circle to close
	await get_tree().create_timer(1).timeout
	_load_main_menu_scene()
