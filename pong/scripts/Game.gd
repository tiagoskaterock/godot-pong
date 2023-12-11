extends Node2D

onready var ball_container = $Ballcontainer
onready var ball_spwan_location = $Ballcontainer/BallSpawnLocation

var Ball = preload("res://pong/scenes/Ball.tscn")

func _ready():
	var ball = Ball.instance()
	ball_container.add_child(ball)
	ball.global_position = ball_spwan_location.global_position



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
