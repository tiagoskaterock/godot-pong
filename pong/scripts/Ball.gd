extends KinematicBody2D

var direction = Vector2.RIGHT

const initial_speed = 50
var speed = initial_speed
const accelerate_rate = 5

const initial_vertical_move = 5
var vertical_move = initial_vertical_move
const increase_vertical_move = 20
var v_move = vertical_move

var dir = 'right'

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		if collision.collider.name == "LeftPaddle":
			dir = "right"
		else: 
			dir = "left"
	check_vertical_move(delta)
	accelerate(delta)
	move_ball(delta)

func check_vertical_move(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:		
		var paddle = collision.collider.get_global_position().y
		var ball = position.y		
		if ball < paddle - 3: v_move = -vertical_move
		elif ball > paddle + 3: v_move = vertical_move
		else: 
			print('meio')
			v_move = 0

func move_ball(delta):	
	if dir == 'right':
		direction = Vector2.RIGHT
		move_and_slide(Vector2(speed, v_move))
	else:
		direction = Vector2.LEFT
		move_and_slide(Vector2(-speed, v_move))
	
func accelerate(delta):
	speed += accelerate_rate * delta
	vertical_move += increase_vertical_move * delta
	
func reset_speed():
	speed = initial_speed
	
func reset_vertical_move():
	v_move = initial_vertical_move
	vertical_move = initial_vertical_move
	
func reset_movement():
	reset_speed()
	reset_vertical_move()
