class_name State
extends Node

export var is_autonomous := false

var _body: Node setget set_body


func _handle_input(event) -> void:
	for child in get_children():
		child._handle_input(event)


func _update(delta) -> void:
	for child in get_children():
		child._update(delta)


func set_body(body: Node) -> void:
	_body = body
	for child in get_children():
		child._body = _body


func _enter() -> void:
	pass

	
func _exit() -> void:
	pass


func enter() -> void:
	_enter()


func exit() -> void:
	_exit()
	for action in get_children():
		action._reset_variables()
