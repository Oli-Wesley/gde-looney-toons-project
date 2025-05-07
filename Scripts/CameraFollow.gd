extends Camera2D


@export var target: CharacterBody2D = null
@export var deadzone : int = 100

func _initialize():
	if target != null:
		position = target.position 
	
func _process(delta: float) -> void:
	if target != null:
		var new_pos: Vector2 = target.position
		new_pos.y += 20
		if new_pos.y > 0:
			new_pos.y = 0
		position = new_pos
	# TODO: some logic here for only keeping the camera further infront of the player when moving, 
	# like aim at some position infront of the player so they can see more.
	# see: https://youtu.be/2VJfPOGTStU?t=417
	


func _on_victory_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Demo-winscreen.tscn")
