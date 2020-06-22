extends Action

export(int) var speed := 200

func _update(delta):
	var dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	body.vel.x = dir * speed
