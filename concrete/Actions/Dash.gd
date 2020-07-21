extends Action

func handle_input(event):
	if event.is_action_pressed("dash"):
		body.velocity.x += body.direction * 1000
