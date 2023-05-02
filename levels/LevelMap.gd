class_name LevelMap
extends TileMap

signal exit_entered(level)

@export var player_start: Vector2i

@export var EXIT_TILE: Vector2i
@export var EXIT_TILE_TO_SCENE: String
@export var EXIT_TILE_TRANS: String

@export var EXIT_TILE_2: Vector2i
@export var EXIT_TILE_TO_SCENE_2: String
@export var EXIT_TILE_TRANS_2: String

@export var EXIT_TILE_3: Vector2i
@export var EXIT_TILE_TO_SCENE_3: String
@export var EXIT_TILE_TRANS_3: String


@onready var player = $Player


func _ready() -> void:
	if Globals.saved_spawn != Vector2i.ZERO:
		player_start = Globals.saved_spawn
		
	player.current_tile = player_start
	player.position= player_start*16
	
	
func switch_scene(tile: Vector2i) -> void:	
	match tile:
		EXIT_TILE:
			emit_signal("exit_entered", EXIT_TILE_TO_SCENE)
			
#			var destination = Globals.exit_code[EXIT_TILE_TO_SCENE]
#			Globals.set_spawn(EXIT_TILE_TRANS)
#			get_tree().change_scene_to_file(destination)
		EXIT_TILE_2:
			emit_signal("exit_entered", EXIT_TILE_TO_SCENE)
			
#			var destination = Globals.exit_code[EXIT_TILE_TO_SCENE_2]
#			Globals.set_spawn(EXIT_TILE_TRANS_2)
#			get_tree().change_scene_to_file(destination)
			
