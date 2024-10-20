extends Node

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

var is_running = false

func _process(delta: float) -> void:
	if is_running:
		time += delta
		
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60

func start_timer() -> void:
	is_running = true
	
	
func stop_timer() -> void:
	is_running = false
	
func reset_timer() -> void:
	time = 0.0
	minutes = 0
	seconds = 0
	msec = 0
