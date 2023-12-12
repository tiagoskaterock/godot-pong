extends KinematicBody2D

const SPEED = 200

func _physics_process(delta):
	if Input.is_action_pressed("player_one_UP"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("player_one_DOWN"):
		position.y += SPEED * delta
	global_position.y = clamp(global_position.y, 20, 380)
