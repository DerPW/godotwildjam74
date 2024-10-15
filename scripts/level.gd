extends Node2D

@onready var player_spawn_point = $PlayerSpawnPoint.position
@onready var key_spawn_point = $KeySpawnPoint.position

func _ready() -> void:
	if not get_parent().has_node("God"): print("Error: Coul not find Player (God) Node in scene tree")
	var player: God = get_parent().get_node("God")
	player.position = player_spawn_point
	
	if not get_parent().has_node("Key"): print("Error: Coul not find Key Node in scene tree")
	var key: Key = get_parent().get_node("Key")
	key.position = key_spawn_point
