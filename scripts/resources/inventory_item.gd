class_name InventoryItem

extends Resource

enum ITEM_TYPE {
	KEY_IRON,
	KEY_GOLD,
	KEY_PLATINUM
}

@export var item_type: ITEM_TYPE
@export var sprite: Texture2D
