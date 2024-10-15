extends Node

signal items_changed(items: Array[InventoryItem])


@export var items: Array[InventoryItem] = []

func has_item(type: InventoryItem) -> bool:
	return items.has(type)
	

func add_item(item: InventoryItem) -> void:
	if items.has(item): 
		return
		
	items.append(item)
	items_changed.emit(items)

func remove_item(item: InventoryItem):
	items.erase(item)
	items_changed.emit(items)
	
