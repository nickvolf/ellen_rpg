class_name InputManager
extends Node

signal action_pressed

@export var _player: Player
@export var MovementManager: MovementManager

var current_direction: Vector2i = Vector2i.DOWN

func _process(_delta):	
	match _player.current_state:
		_player.State.IDLE:	
			var direction: Vector2i = Vector2i.ZERO
			if Input.is_action_pressed("ui_up"):
				direction += Vector2i.UP
				_player.sprite.animation = "walk_up"
				_player.ray_cast_2d.target_position = direction * Globals.TILE_SIZE
			elif Input.is_action_pressed("ui_down"):
				direction += Vector2i.DOWN
				_player.sprite.animation = "walk_down"
				_player.ray_cast_2d.target_position = direction * Globals.TILE_SIZE
			elif Input.is_action_pressed("ui_left"):
				direction += Vector2i.LEFT
				_player.sprite.animation = "walk_left"
				_player.ray_cast_2d.target_position = direction * Globals.TILE_SIZE
			elif Input.is_action_pressed("ui_right"):
				direction += Vector2i.RIGHT
				_player.sprite.animation = "walk_right"
				_player.ray_cast_2d.target_position = direction * Globals.TILE_SIZE
						
			if direction != Vector2i.ZERO:
				if direction != current_direction:
					current_direction=direction
					return
					
				MovementManager.move_to_tile(direction)
				_player.sprite.play()
			
		_player.State.ACTION:			
			pass
