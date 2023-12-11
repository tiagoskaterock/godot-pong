extends Area2D

var speed = 100
var direction = Vector2.LEFT
var accelerate_rate = 2

func _physics_process(delta):
	accelerate(delta)
	move_ball(delta)

func move_ball(delta):
	global_position += speed * direction * delta
	
func accelerate(delta):
	speed += delta * accelerate_rate
	
