class_name StateMachine
extends Node

signal state_changed

export(NodePath) var _initial_state: NodePath

onready var _body = get_parent() setget set_body

var _state = null setget set_state

func _ready():
	_state = get_node(_initial_state)

func change_state(state_path : NodePath):
	var state = get_node(state_path)
	_state = state

func set_state(state):
	if _state:
		_state.exit()
	self._state = state
	_state.enter()

func set_body(body):
	self._body = body
	self._state._body = _body

func add_state(state):
	add_child(state)
	