extends Node

var levels: Dictionary = {
	"bedroom": "res://levels/bedroom.tscn",
	"house": "res://levels/house.tscn",
	"town": "res://levels/town.tscn",
	"cave1": "res://levels/bedroom.tscn"
}


@onready var current_level : = $BaseLevel


func _ready() -> void:
	current_level.connect("exit_entered", change_level)

	
func change_level(level: String) -> void:
	var next_level_scene = load(levels[level])
	var next_level = next_level_scene.instance()
	add_child(next_level)
	current_level.queue_free()
	next_level = current_level
	
