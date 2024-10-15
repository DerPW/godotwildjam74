class_name Pickup

extends Area2D

signal collected()

@export var item: InventoryItem

func collect() -> void:
	collected.emit()
