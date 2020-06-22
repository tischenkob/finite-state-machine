extends Action

func handle_input(event):
	if event.is_action_pressed("dash"):
		body.vel.x += 1000
