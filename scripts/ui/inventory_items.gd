class_name InventoryItemUI

extends Control




func _ready() -> void:
	Inventory.items_changed.connect(update_inventory_items)

func update_inventory_items(items: Array[InventoryItem]) -> void:
	for child in get_children():
		remove_child(child)
		
	for item in items:
		var elem = TextureRect.new()
		elem.texture = item.sprite
		add_child(elem)
		
		
