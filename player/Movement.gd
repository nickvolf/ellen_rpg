class_name MovementManager
extends Node

signal exit_entered(level_code: String, spawn_code: String)

const WALK_TIME := 0.4

@export var _player: Player
@export var velocity := 100.0

var direction := Vector2.ZERO
var is_moving := false

@onready var LevelMap: TileMap = $".."



func move_to_tile(_direction: Vector2i) -> void:
	_player.set_state(_player.State.ACTION)
	var current_pos: Vector2i = _player.current_tile
	var new_tile: Vector2i = current_pos + _direction
	var new_position: Vector2 = new_tile * Globals.TILE_SIZE
	var new_box_position: Vector2
	_player.ray_cast_2d.target_position = _direction * Globals.TILE_SIZE
	
	
	# Check new tile is walkable for player
	if is_next_cell_empty(new_tile) == false:
		return
	
	
	# Check if next tile has pushable object:
	var pushable_box = null
	var is_moving_box := false
	if _player.ray_cast_2d.is_colliding():		
		pushable_box = _player.ray_cast_2d.get_collider()
		if pushable_box.is_in_group("box"):
			new_box_position = pushable_box.position + Vector2((_direction*Globals.TILE_SIZE))
			is_moving_box = true
			
			# Checking if the box can move
			if is_next_cell_empty(new_tile+_direction) == false:
				return
	
	
	# Movement
	var t: Tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
	t.tween_property(_player, "position", new_position, WALK_TIME)
	if pushable_box != null and is_moving_box == true:
		t.parallel().tween_property(pushable_box, "position", new_box_position, WALK_TIME)
	_player.current_tile = new_tile
	await t.finished
	
	# Post Movement
	_player.sprite.stop()
	if LevelMap.get_cell_source_id(5, new_tile) != -1:
		print(new_tile)
		LevelMap.switch_scene(new_tile)		
	_player.set_state(_player.State.IDLE)
	
	check_player_in_exit()


func is_next_cell_empty(tile: Vector2i) -> bool:
	if LevelMap.get_cell_source_id(0, tile) != -1:
		_player.set_state(_player.State.IDLE)
		return false
	return true


func check_player_in_exit():
	var overlapping_areas := _player.get_overlapping_areas()
	for area in overlapping_areas:
		if area.is_in_group("exit"):			
			LevelMap.set_process(false)
			LevelMap.input_manager.set_process(false)
			emit_signal("exit_entered", area.EXIT_TO_CODE, area.EXIT_TRANSITION_CODE)
