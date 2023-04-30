extends Camera2D

@export var level_map: TileMap

func _ready():
	var map_rect = level_map.get_used_rect()
	print(map_rect)
	limit_top = 0
	limit_left = 0	
	limit_bottom = map_rect.size.y * 16
	limit_right = map_rect.size.x * 16
