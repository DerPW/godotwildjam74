extends PointLight2D

@onready var tween: Tween = self.create_tween()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween.tween_property(self, ^"energy", 1.0, 2)
	tween.tween_property(self, ^"energy", .6, .2)
	tween.set_loops()
	
