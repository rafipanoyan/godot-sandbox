extends Node
class_name StateMachine

export var initial_state: NodePath

onready var state: State = get_node(initial_state) setget set_state
onready var _state_name = state.name

onready var states: Dictionary = {
	"Move": $Move,
	"Targeting": $Targeting
}

func _init():
	add_to_group("state_machine")

func _unhandled_input(event):
	state.unhandled_input(event)

func _physics_process(delta):
	state.physics_process(delta)

func transition_to(new_state_path: String, msg: Dictionary = {}):
	if(not states.has(new_state_path)):
		return
	
	var new_state = states[new_state_path]
	
	if(state == new_state):
		return
	
	state._exit()
	self.state = new_state
	state._enter(msg)

func set_state(value: State):
	state = value
	_state_name = value.name                  
