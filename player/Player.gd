class_name Player
extends Area2D

enum State {IDLE, ACTION }

var current_state := State.IDLE
var current_tile := Vector2i.ZERO


func set_state(new_state: State):
	current_state = new_state


