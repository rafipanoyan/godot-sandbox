extends Node

class_name State

onready var state_machine = _get_state_machine(self)

func unhandled_input(event):
	return

func physics_process(delta):
	return

func _enter(msg: Dictionary):
	return

func _exit():
	return

func _get_state_machine(node: Node) -> Node:
	if(node != null and not node.is_in_group("state_machine")):
		return _get_state_machine(node.get_parent())
	return node
