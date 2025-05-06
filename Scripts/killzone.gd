extends Area2D

@export var audio_stream: AudioStream 
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	audio_player.stream = audio_stream

func _on_body_entered(body: Node2D) -> void:

	if not audio_stream:
		push_error("Audio stream not assigned!")
		return
	audio_player.play();
	var timer := Timer.new()
	timer.wait_time = audio_player.stream.get_length()
	timer.one_shot = true
	add_child(timer)
	timer.connect("timeout", _on_timer_timeout)
	timer.start()
	body.set_process(false)

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
