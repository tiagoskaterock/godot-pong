extends Area2D

func add_goal(): 
	if position.x > 0: add_goal_player_one()
	else: add_goal_player_two()
	
func add_goal_player_one():
	print(get_parent().get_parent().add_goal(1))
	
func add_goal_player_two():
	print(get_parent().get_parent().add_goal(2))

func _on_VerticalWall_body_entered(body):
	if body.name == 'Ball': add_goal()
