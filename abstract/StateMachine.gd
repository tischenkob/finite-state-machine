extends Node
class_name StateMachine

signal state_changed

export(NodePath) var _initial_state: NodePath

onready var body = $".."

var current_state : State = null

func _ready() -> void:
	initialize_state(_initial_state)

func _input(event):
	current_state.handle_input(event)
	
func _physics_process(delta) -> void:
	self._update(delta)

func _update(delta) -> void:
	current_state._update(delta)

func _change_state(state_name) -> void:
	for child in get_children():
		if child.name == state_name:
			current_state.exit()
			current_state = get_node(state_name)
			emit_signal("state_changed", current_state)
			current_state.enter()
			return

func initialize_state(state_name) -> void:
	current_state = get_node(state_name)
	current_state.enter()

func add_action(action_node, state_name):
	var state = get_node(state_name)
	if not state == null:
		state.add_child(action_node)
		action_node.connect("action_performed", self, "_change_state")
