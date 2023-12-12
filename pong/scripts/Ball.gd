extends KinematicBody2D

var speed = 300
var direction = Vector2.RIGHT
var accelerate_rate = 2

func _physics_process(delta):
	if is_on_wall():
		speed *= -1
	accelerate(delta)
	move_ball(delta)

func move_ball(delta):
	move_and_slide(Vector2(speed, 0)) 
	
func accelerate(delta):
	speed += delta * accelerate_rate
	
