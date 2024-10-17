extends Node

signal level_started
signal level_ended

@export var level_folder_path : String
var level_scenes : Array
var current_level := 0

func _ready() -> void:
	# load levels as packed scene from level folder
	level_scenes = _load_level_scenes(level_folder_path)
	
	# load first level
	_load_level(current_level)

func _load_level_scenes(folder_path: String) -> Array:
	var dir = DirAccess.open(folder_path)
	var packed_scenes = []
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	
	while file_name != "":
		if not dir.current_is_dir():
			if file_name.ends_with(".tscn") or file_name.ends_with(".scn"):
				var full_path = folder_path + file_name
				var packed_scene = load(full_path) as PackedScene
				if packed_scene:
					packed_scenes.append(packed_scene)
			
		file_name = dir.get_next()
	
	dir.list_dir_end()
	
	return packed_scenes

func _load_level(level: int) -> void:
	var packed_scene = level_scenes[level]
	var level_instance = packed_scene.instantiate()
	level_instance.name = "Level_" + str(current_level + 1)
	add_child(level_instance)
	
	# connect to completed signal
	if level_instance.has_signal("completed"):
		level_instance.connect("completed", _on_level_completed) 
	
	level_started.emit()

func _on_level_completed():
	level_ended.emit()
	print("LEVEL COMPLETED")
