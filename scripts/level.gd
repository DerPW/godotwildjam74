extends Node2D

signal completed

@onready var player_spawn_point = $PlayerSpawnPoint.position

func _ready() -> void:
	if not get_parent().get_parent().has_node("God"): print("Error: Coul not find Player (God) Node in scene tree")
	var player: God = get_parent().get_parent().get_node("God")
	player.position = player_spawn_point
	
	if not get_parent().get_parent().has_node("Ghost"): print("Error: Coul not find Ghost Node in scene tree")
	var ghost: Ghost = get_parent().get_parent().get_node("Ghost")
	ghost.position = Vector2(-100, 100)


func _on_door_player_entered() -> void:
	completed.emit()
