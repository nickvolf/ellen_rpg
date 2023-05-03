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

@export var box_1_start: Vector2i
@export var box_2_start: Vector2i
@export var box_3_start: Vector2i


var box_scene := preload("res://levels/scenes/box.tscn")


@onready var player = $Player


func _ready() -> void:
	place_player()
	place_boxes()
	
	
func place_player() -> void:
	if Globals.saved_spawn != Vector2i.ZERO:
		player_start = Globals.saved_spawn
	player.current_tile = player_start
	player.position= player_start*Globals.TILE_SIZE
	


func place_boxes()->void:
	if box_1_start != Vector2i.ZERO:
		create_box(box_1_start)
	if box_2_start != Vector2i.ZERO:
		create_box(box_2_start)
	if box_3_start != Vector2i.ZERO:
		create_box(box_3_start)
	
	
func create_box(pos: Vector2i) -> void:
	var box = box_scene.instantiate()
	box.position = pos * Globals.TILE_SIZE
	add_child(box)
	

	
func switch_scene(tile: Vector2i) -> void:	
	match tile:
		EXIT_TILE:
			emit_signal("exit_entered", EXIT_TILE_TO_SCENE, EXIT_TILE_TRANS)
			
#			var destination = Globals.exit_code[EXIT_TILE_TO_SCENE]
#			Globals.set_spawn(EXIT_TILE_TRANS)
#			get_tree().change_scene_to_file(destination)
		EXIT_TILE_2:
			emit_signal("exit_entered", EXIT_TILE_TO_SCENE, EXIT_TILE_TRANS)
			
#			var destination = Globals.exit_code[EXIT_TILE_TO_SCENE_2]
#			Globals.set_spawn(EXIT_TILE_TRANS_2)
#			get_tree().change_scene_to_file(destination)
			
