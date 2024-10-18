extends Area2D

signal player_fell_to_their_death


func _on_body_entered(body: Node2D) -> void:
	if body is not God:
		return
		
	player_fell_to_their_death.emit()
