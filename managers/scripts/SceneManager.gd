extends Node

var levels: Dictionary = {
	"level1": "res://levels/scenes/base/level.tscn",
	"level2": "res://levels/scenes/bedroom.tscn",
}

var saved_spawn := Vector2i.ZERO


var spawn_codes: Dictionary = {
	"house_to_bedroom": Vector2i(11,2),
	"bedroom_to_house": Vector2i(1,7),
	"house_to_town": Vector2i(6,5),
	"town_to_house": Vector2i(12,8),
}

var debug_next_level: String = "level2"

@onready var current_level = $Level

func _ready() -> void:
	current_level.connect("exit_entered", change_level)
	
func change_level(level: String, spawn_code: String) -> void:
	var next_level_scene = load(levels[level])
	var next_level = next_level_scene.instantiate()
	add_child(next_level)
	
	# Set Player Position
	
	
	current_level.queue_free()
	current_level = next_level
	
func _process(_delta) -> void:	
	if Input.is_action_just_pressed("ui_select"):
		print("Change")
		change_level(debug_next_level, "town_to_house")
		match debug_next_level:
			"level1":
				debug_next_level = "level2"
			"level2":
				debug_next_level = "level1"
		
func set_spawn(key: String):
	saved_spawn = spawn_codes[key]
