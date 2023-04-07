extends Node

signal action_pressed

@export var _player: Player
@export var MovementManager: MovementManager
 

func _process(delta):
	match _player.current_state:
		_player.State.IDLE:	
			var direction: Vector2i = Vector2i.ZERO
			if Input.is_action_pressed("ui_up"):
				direction += Vector2i.UP
			elif Input.is_action_pressed("ui_down"):
				direction += Vector2i.DOWN
			elif Input.is_action_pressed("ui_left"):
				direction += Vector2i.LEFT
			elif Input.is_action_pressed("ui_right"):
				direction += Vector2i.RIGHT
			
			if direction != Vector2i.ZERO:
				MovementManager.move_to_tile(direction)
			
		_player.State.ACTION:			
			pass
