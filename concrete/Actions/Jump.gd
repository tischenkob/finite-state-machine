extends Action

export(int) var jump_strength = 500

func _handle_input(event):
	if event.is_action_pressed("ui_up"):
		_body.velocity.y += -jump_strength

