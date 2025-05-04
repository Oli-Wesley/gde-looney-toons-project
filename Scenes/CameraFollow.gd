extends Camera2D


@export var target: CharacterBody2D = null
@export var deadzone : int = 100

func _initialize():
	if target != null:
		position = target.position 
	
func _process(delta: float) -> void:
	if target != null:
		position = target.position
	# TODO: some logic here for only keeping the camera further infront of the player when moving, 
	# like aim at some position infront of the player so they can see more.
	# see: https://youtu.be/2VJfPOGTStU?t=417
	
