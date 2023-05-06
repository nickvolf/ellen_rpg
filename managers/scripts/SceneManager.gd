extends Node


var debug_next_level: String = "level2"
var saved_spawn := Vector2i.ZERO
var levels: Dictionary = {
	"level1": "res://levels/scenes/base/level.tscn",
	"level2": "res://levels/scenes/bedroom.tscn",
	"bedroom": "res://levels/scenes/bedroom.tscn",
	"house": "res://levels/scenes/house.tscn",
}

var spawn_codes: Dictionary = {
	"bedroom_to_house": Vector2i(1,7),
}


@onready var animation_player := $CanvasLayer/ColorRect/AnimationPlayer
@onready var current_level := $Level


func _ready() -> void:
	connect_level_signals()
	
	
func change_level(level: String, spawn_code: String) -> void:		
	var next_level_scene = load(levels[level])
	var next_level = next_level_scene.instantiate()
	add_child(next_level)
	
	
	# Set Player Position
	
	current_level.queue_free()
	current_level = next_level
	connect_level_signals()
	animation_player.play("FadeToNormal")


func connect_level_signals():
	current_level.movement_manager.connect("exit_entered", level_transition)


func _process(_delta) -> void:	
	if Input.is_action_just_pressed("ui_select"):
		level_transition(debug_next_level, "town_to_house")
		match debug_next_level:
			"level1":
				debug_next_level = "level2"
			"level2":
				debug_next_level = "level1"

		
func set_spawn(key: String) -> void:
	saved_spawn = spawn_codes[key]


func level_transition(level: String, spawn_code: String) -> void:
	animation_player.play("FadeToBlack")
	await animation_player.animation_finished
	change_level(level, spawn_code)
