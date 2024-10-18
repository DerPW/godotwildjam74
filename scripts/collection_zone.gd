class_name CollectionZone

extends Area2D

signal collected(item: InventoryItem)

func _ready() -> void:
	area_entered.connect(_on_area_enter)


func _on_area_enter(area: Area2D) -> void:
	if area is not Pickup:
		return
		
	area.collect()
	Inventory.add_item(area.item)
	collected.emit(area.item)
