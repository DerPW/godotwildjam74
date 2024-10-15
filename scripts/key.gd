class_name Key

extends RigidBody2D

const SHINE_TIME = 10

@export var item: InventoryItem

@onready var sprite: Sprite2D = $Sprite2D
@onready var tween: Tween = get_tree().create_tween().set_loops()
@onready var pickup: Pickup = $Pickup

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween.tween_property(sprite.material, "shader_parameter/shine_progress", 1.0, .5).from_current()
	tween.tween_interval(2.0)
	pickup.item = item
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pickup_collected() -> void:
	queue_free()
