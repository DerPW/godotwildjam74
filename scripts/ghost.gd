class_name Ghost

extends Node2D

signal catched_player

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Player: return
	print("touched player")
	catched_player.emit()
