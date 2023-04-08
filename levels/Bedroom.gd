extends Node2D

@export var player_start:=Vector2i(5,5)
@onready var tile_map = $TileMap


func _ready():
	tile_map.set_player(player_start)

