extends Node

signal level_started
signal level_ended

@export var level_folder_path : String
@export var level_scenes : Array[PackedScene]
var current_level := 0

func _ready() -> void:
	# load levels as packed scene from level folder
	#level_scenes = _load_level_scenes(level_folder_path)
	
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
	# add 🗝️ back if player collected
	_reset_key()
	
	var packed_scene = level_scenes[level]
	var level_instance = packed_scene.instantiate()
	add_child(level_instance)
	
	# connect to completed signal
	if level_instance.has_signal("completed"):
		level_instance.connect("completed", _on_level_completed) 
	
	level_started.emit()

func _unload_level(level: int) -> void:
	if get_child_count() <= 0: 
		print("unable to unload level " + str(level + 1) + ", could not find node") 
		return
	# get rid of that 💩
	get_child(0).queue_free()

func _restart_level() -> void:
	# circle closes
	level_ended.emit()
	# wait for circle to close
	await get_tree().create_timer(1).timeout
	_unload_level(current_level)
	
	_load_level(current_level)
	# circle open
	level_started.emit()

func _reset_key() -> void:
	Inventory.clear_items()

func _on_level_completed() -> void:
	level_ended.emit()
	# wait for circle to close
	await get_tree().create_timer(1).timeout
	_unload_level(current_level)
	current_level += 1
	
	# check if it was the last level
	if current_level >= level_scenes.size():
		print("This was the last level")
		return
	
	_load_level(current_level)


func _on_ghost_catched_player() -> void:
	_restart_level()
