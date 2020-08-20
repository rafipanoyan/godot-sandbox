extends State
class_name Targeting

const MAX_TARGET_DISTANCE := 100.0

export var target_path: NodePath
export var target_speed := 100.0

onready var target = get_node(target_path)

var current_direction_vec := Vector2.ZERO
var current_target_distance_from_turret := 0

func _ready():
	target.hide()

func _enter(msg: Dictionary):
	current_direction_vec = msg.get("current_direction")
	target.show()
	
func unhandled_input(event):
	if(not Input.is_action_pressed("fire")):
		state_machine.transition_to("Move")

func physics_process(delta):
	current_target_distance_from_turret += min(target_speed * delta, MAX_TARGET_DISTANCE)
	var target_vec = current_direction_vec.normalized() * current_target_distance_from_turret
	target_vec = target_vec.rotated(-owner.rotation)
	target.position = target_vec

func _exit():
	current_target_distance_from_turret = 0
	target.position = Vector2.ZERO
	target.hide()
