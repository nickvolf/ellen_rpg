extends Node

var num_players := 8
var bus := "master"

var available := []
var queue := []

var sounds := {
	"puzzle_solved": "res://sounds/puzzle_solve.mp3"
}

func _ready():
	# Create the pool of AudioStreamPlayer nodes.
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.connect("finished", func(): _on_stream_finished(p))
		p.bus = bus
		
		
func _on_stream_finished(stream) -> void:
	# When finished playing a stream, make the player available again.
	available.append(stream)

## Take a string to play a sound
func play(sound_path: String) -> void:
	queue.append(sound_path)
	
	
func _process(delta: float) -> void:
	# Play a queued sound if any players are available.
	if not queue.is_empty() and not available.is_empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()
