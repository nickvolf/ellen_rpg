class_name TriggerManager
extends Node

@export var door_coordinates: Vector2i
@export var level: LevelMap

var coordinates: Vector2i

func _ready() -> void:
	coordinates = get_parent().position / Globals.TILE_SIZE.x

func check(new_position):
	new_position = ceil(new_position/Globals.TILE_SIZE.x)
	var check_position = Vector2i(new_position.x, new_position.y)
	print(check_position)
	print(coordinates)
	
	
	if check_position == coordinates:
		SoundManager.play(SoundManager.sounds["puzzle_solved"])
		remove_collision_and_open_door()

## Removes the colision from the tile and changed the gate sprite
func remove_collision_and_open_door():	
	level.set_cell(0, door_coordinates, -1)
	level.set_cell(3, door_coordinates, 0, Vector2i(50,12))
	print("Unlocked")

