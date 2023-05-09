extends Camera2D

@export var level_map: TileMap
@onready var player = $".."

func _ready():
	var map_rect = level_map.get_used_rect()
	limit_top = 0
	limit_left = 0	
	limit_bottom = map_rect.size.y * 16
	limit_right = map_rect.size.x * 16
