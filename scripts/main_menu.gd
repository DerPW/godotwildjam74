extends Control

const MAIN = preload("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)


func _on_button_pressed() -> void:
	_load_main_scene()
