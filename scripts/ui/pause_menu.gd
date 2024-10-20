extends Control

signal game_paused
signal game_resumed

@onready var minutes: Label = $Panel/Timer/Minutes
@onready var seconds: Label = $Panel/Timer/Seconds

var is_paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_paused(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(&"pause"):
		if is_paused == false:
			_set_paused(true)
		else:
			_set_paused(false)


func _set_paused(value: bool) -> void:
	is_paused = value
	
	if is_paused:
		self.show()
		game_paused.emit()
		SpeedRunTimer.stop_timer()
		
		minutes.text = "%02d:" % SpeedRunTimer.minutes
		seconds.text = "%02d" % SpeedRunTimer.seconds
		
		
	else:
		self.hide()
		game_resumed.emit()
		SpeedRunTimer.start_timer()


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/main_menu.tscn"))


func _on_resume_button_pressed() -> void:
	_set_paused(false)
