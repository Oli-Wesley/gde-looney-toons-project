extends Area2D

@onready var timer = $Timer

func _on_body_entered(body): 
	$AudioStreamPlayer.play()
	$Timer.start()

func _on_timer_timeout(timer):
	get_tree().reload_current_scene()
