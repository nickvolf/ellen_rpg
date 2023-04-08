extends TileMap

@export var EXIT_TILE := Vector2i(3,7)
@export var EXIT_TO_SCENE: PackedScene = preload("res://levels/house.tscn")

var player_start

@onready var player = $Player


func set_player(tile: Vector2i) -> void:
	player_start = tile
	player.current_tile = player_start
	player.position= player_start*16
	
	
func switch_scene(tile: Vector2i) -> void:
	match tile:
		EXIT_TILE:
			get_tree().change_scene_to_packed(EXIT_TO_SCENE)
