extends State

var current_direction_vec := Vector2.UP

func unhandled_input(event):
	if(Input.is_action_just_pressed("fire")):
		state_machine.transition_to("Targeting")

func physics_process(delta):
	rotate_to_mouse()
	
func rotate_to_mouse():
	var mouse_position = get_viewport().get_mouse_position()
	var turret_to_mouse_vec = mouse_position - owner.position
	
	var angle = current_direction_vec.angle_to(turret_to_mouse_vec)
	
	if(angle != 0):
		owner.rotate(angle)
	
	current_direction_vec = turret_to_mouse_vec
