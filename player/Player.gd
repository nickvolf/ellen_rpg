class_name Player
extends Area2D

enum State {IDLE, ACTION }

var current_state := State.IDLE
var current_tile := Vector2i.ZERO


@onready var label: Label = $Label
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var ray_cast_2d: RayCast2D = $RayCast2D


func set_state(new_state: State):
	current_state = new_state
	label.text = str(current_tile)

