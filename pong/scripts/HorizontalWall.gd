extends Area2D

func _on_HorizontalWall_body_entered(body):
	if body.name == "Ball":
		body.v_move *= -1
