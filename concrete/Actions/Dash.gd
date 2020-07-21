extends Action

func _handle_input(event):
	if event.is_action_pressed("dash"):
		_body.velocity.x += _body.direction * 1000
