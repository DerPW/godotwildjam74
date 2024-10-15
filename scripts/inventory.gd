class_name Inventory

extends Node

signal items_changed(items: Array[InventoryItem])


@export var items: Array[Pickup.PICKUP_TYPE] = []

func has_item(type: Pickup.PICKUP_TYPE) -> bool:
	return items.has(type)
	

	
