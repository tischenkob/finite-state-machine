class_name State
extends Node

onready var _body : Node setget set_body

func handle_input(event):
	for child in get_children():
		child.handle_input(event)

func _update(delta) -> void:
	for child in get_children():
		child._update(delta)

func set_body(body : Node):
	_body = body
	for child in get_children():
		child._body = _body

func enter() -> void:
	pass

func exit() -> void:
	pass

