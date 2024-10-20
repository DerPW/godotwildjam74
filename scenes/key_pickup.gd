extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Inventory.item_added.connect(_item_added)

func _item_added(item: InventoryItem) -> void:
	self.play()
