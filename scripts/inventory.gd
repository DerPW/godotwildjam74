class_name Inventory

extends Node

signal items_changed(items: Array[InventoryItem])


@export var items: Array[InventoryItem] = []

func has_item(type: InventoryItem) -> bool:
	return items.has(type)
	

	
