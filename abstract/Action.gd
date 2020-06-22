extends Node
class_name Action

signal action_performed

var body: PhysicsBody2D = null

func _ready():
	var found_body = get_parent()
	while not found_body is PhysicsBody2D:
		found_body = found_body.get_parent()
	body = found_body as PhysicsBody2D

func _update(_delta):
	pass

func handle_input(event):
	pass
