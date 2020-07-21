class_name StateMachine
extends Node

signal state_changed

export (NodePath) var _initial_state: NodePath

var _state setget set_state
var _body setget set_body


func _ready() -> void:
	self._state = get_node(_initial_state)
	self._body = get_parent()


func _physics_process(delta) -> void:
	_state._update(delta)


func _input(event) -> void:
	_state._handle_input(event)


func change_state(state_path: NodePath) -> void:
	var state = get_node(state_path)
	self._state = state


func set_state(state) -> void:
	if _state:
		_state.exit()
	_state = state
	_state._body = _body
	_state.enter()


func set_body(body) -> void:
	_body = body
	for child in get_children():
		child._body = _body


func add_state(state) -> void:
	add_child(state)
