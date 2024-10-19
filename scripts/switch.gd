extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@export var walls_tilemap_layer : TileMapLayer
@export var switchable_walls_coordinates: Array[Vector2i]

func _ready() -> void:
	pass

var activated := false :
	set(value): 
		activated = value
		_activate_switch(value)
	get: return activated

func _activate_switch(value : bool) -> void:
	if not value and activated: return
	sprite_2d.region_rect = Rect2(16, 0, 16, 16)
	audio_stream_player.play()
	walls_tilemap_layer.set_cells_terrain_connect(switchable_walls_coordinates, 0, -1)


func _on_activation_area_body_entered(body: Node2D) -> void:
	if not body is God or activated: return 
	activated = true
