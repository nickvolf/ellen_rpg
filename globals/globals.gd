extends Node


const TILE_SIZE :Vector2i = Vector2i(16,16)

var saved_spawn := Vector2i.ZERO

var exit_code: Dictionary = {
	"bedroom": "res://levels/bedroom.tscn",
	"house": "res://levels/house.tscn",
	"town": "res://levels/town.tscn",
}

var spawn_codes: Dictionary = {
	"house_to_bed": Vector2i(3,7),
	"bed_to_house": Vector2i(1,7),
	"house_to_town": Vector2i(7,6),
	"town_to_house": Vector2i(12,8),
}

func set_spawn(key: String):
	saved_spawn = spawn_codes[key]
