class_name Door

extends Node2D

signal player_entered

const OPEN_FRAME = 0
const CLOSED_FRAME = 1

@export var is_open: bool = false
@export var key: InventoryItem

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var open_light: PointLight2D = $OpenLight
@onready var closed_light: PointLight2D = $ClosedLight

func _ready() -> void:
	set_open(is_open)


func set_open(open: bool) -> void:
	is_open = open
	
	var current_frame = CLOSED_FRAME
	open_light.hide()
	closed_light.show()
	
	if open:
		current_frame = OPEN_FRAME
		open_light.show()
		closed_light.hide()
	
	animated_sprite_2d.set_frame_and_progress(current_frame, 0.0)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not God:
		return
		
	if Inventory.has_item(key):
		set_open(true)
		Inventory.remove_item(key)


func _on_enter_area_body_entered(body: Node2D) -> void:
	if body is not God:
		return
		
	if not is_open:
		return
		
	player_entered.emit()
