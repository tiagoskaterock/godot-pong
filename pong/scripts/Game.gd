extends Node2D

const win_points = 3
var difficulty = 2

onready var ball_container = $Ballcontainer
onready var ball_spwan_location = $Ballcontainer/BallSpawnLocation

var player_one_points = 0
var player_two_points = 0
var winner = 'none'
var ball
var Ball = preload("res://pong/scenes/Ball.tscn")

func _ready():
	ball = Ball.instance()
	ball.global_position = ball_spwan_location.global_position
	ball_container.add_child(ball)
	
func _process(delta):
	if(player_one_points == win_points):
		winner = 'Player One'
		get_tree().change_scene("res://pong/scenes/WinScreenPlayerOne.tscn")
	elif(player_two_points == win_points):
		winner = 'Player Two'
		get_tree().change_scene("res://pong/scenes/WinScreenPlayerTwo.tscn")
		
func add_goal(player):
	$WaitNewBallTimer.start()
	update_score(player)
	show_new_score()
	
func _on_WaitNewBallTimer_timeout():
	ball.global_position = ball_spwan_location.global_position
	ball.reset_movement()
	
func update_score(player):
	if player == 1: player_one_points += 1
	else: player_two_points += 1
	
func show_new_score():	
	$Graphics/ScoreLabelPlayerOne.text = str(player_one_points)
	$Graphics/ScoreLabelPlayerTwo.text = str(player_two_points)
