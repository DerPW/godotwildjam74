class_name Pickup

extends Area2D

signal collected()

enum PICKUP_TYPE {
	KEY_IRON
}

@export var type: PICKUP_TYPE

func collect() -> void:
	collected.emit()
