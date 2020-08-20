extends Area2D

var current_direction = Vector2.UP

func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var vec_from_turret = mouse_position - position
	
	var angle = current_direction.angle_to(vec_from_turret)
	
	if(angle != 0):
		rotate(angle)
	
	current_direction = vec_from_turret
