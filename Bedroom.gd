extends Node2D

var player_start:=Vector2i(5,5) 
@onready var player :Player = $TileMap/Player

# Called when the node enters the scene tree for the first time.
func _ready():
	player.current_tile = player_start
	player.position= player_start*16


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
