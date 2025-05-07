extends Control

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()

func _on_timer_timeout(timer):
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
