extends Node
class_name State

var body : Node = null

func handle_input(event):
	for child in get_children():
		if child is Action:
			child.handle_input(event)

func enter() -> void:
	self.body = body

func exit() -> void:
	self.body = null

func _update(delta) -> void:
	for child in get_children():
		if child is Action:
			child._update(delta)
