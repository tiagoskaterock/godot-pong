extends Node2D

onready var ball_container = $Ballcontainer
onready var ball_spwan_location = $Ballcontainer/BallSpawnLocation

var player_one_points = 0
var player_two_points = 0
var ball

var Ball = preload("res://pong/scenes/Ball.tscn")

func _ready():
	ball = Ball.instance()	
	ball.global_position = ball_spwan_location.global_position
	ball_container.add_child(ball)

func add_goal(player):	
	reset_ball()
	update_score(player)
	show_new_score()
	
func reset_ball():
	ball.global_position = ball_spwan_location.global_position
	ball.reset_movement()
	
func update_score(player):
	if player == 1: player_one_points += 1
	else: player_two_points += 1
	
func show_new_score():	
	print("P1: " + str(player_one_points))
	print("P2: " + str(player_two_points))
