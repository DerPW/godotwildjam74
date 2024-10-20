class_name Hud

extends Control

signal game_paused
signal game_resumed


func _on_pause_menu_game_paused() -> void:
	game_paused.emit()


func _on_pause_menu_game_resumed() -> void:
	game_resumed.emit()
