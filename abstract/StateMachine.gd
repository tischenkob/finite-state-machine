extends Node
class_name StateMachine

signal state_changed

export(NodePath) var _constant_state : NodePath 
export(NodePath) var _initial_state: NodePath
export(NodePath) var body_path: NodePath

onready var body = $".."
var constant_state : State = null
var current_state : State = null
var _active := false setget set_active

func _ready() -> void:
	constant_state = get_node(_constant_state)
	constant_state.enter(self.body)
	initialize_state(_initial_state)

func _input(event):
	current_state.handle_input(event)
	
func _physics_process(delta) -> void:
	self._update(delta)

func _update(delta) -> void:
	constant_state._update(delta)
	current_state._update(delta)

func _change_state(state_name) -> void:
	if not _active:
		return
	for child in get_children():
		if child.name == state_name:
			current_state.exit()
			current_state = get_node(state_name)
			emit_signal("state_changed", current_state)
			current_state.enter(self.body)

func initialize_state(state_name) -> void:
	set_active(true)
	current_state = get_node(state_name)
	current_state.enter(self.body)

func set_active(value) -> void:
	_active = value
	set_physics_process(value)
	set_process_input(value)
	if not _active:
		current_state = null

func add_action(action_node, state_name):
	var state = get_node(state_name)
	if not state == null:
		state.add_child(action_node)
		action_node.connect("action_performed", self, "_change_state")
