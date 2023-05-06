class_name LevelMap
extends TileMap



@export var player_start: Vector2i


var box_scene := preload("res://levels/scenes/box.tscn")


@onready var player = $Player
@onready var input_manager = $InputManager
@onready var movement_manager = $MovementManager


func _ready() -> void:
	place_player()
	
	
func place_player() -> void:
	if Globals.saved_spawn != Vector2i.ZERO:
		player_start = Globals.saved_spawn
	player.current_tile = player_start
	player.position= player_start*Globals.TILE_SIZE
	

	
	
func create_box(pos: Vector2i) -> void:
	var box = box_scene.instantiate()
	box.position = pos * Globals.TILE_SIZE
	add_child(box)
