class_name MovementManager
extends Node

const WALK_TIME := 0.4

@export var _player: Player
@export var velocity := 100.0

@onready var LevelMap: TileMap = $".."

var direction := Vector2.ZERO
var is_moving := false

func move_to_tile(direction: Vector2i) -> void:
	_player.set_state(_player.State.ACTION)
	var current_pos: Vector2i = _player.current_tile
	var new_tile: Vector2i = current_pos + direction
	var new_position: Vector2 = new_tile * Globals.TILE_SIZE
	
	# Check new tile is empty	
	if LevelMap.get_cell_source_id(0, new_tile) != -1:
		_player.set_state(_player.State.IDLE)
		return
	
	# Movement
	var t: Tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
	t.tween_property(_player, "position", new_position, WALK_TIME)
	_player.current_tile =new_tile
	await t.finished
	
	# Post Movement
	if LevelMap.get_cell_source_id(5, new_tile) != -1:
		print(new_tile)
		LevelMap.switch_scene(new_tile)
		
	_player.set_state(_player.State.IDLE)
	
	
	
	
