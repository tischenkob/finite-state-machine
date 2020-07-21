extends Action

export(int) var speed := 200
export(int) var acceleration := 50
export(int) var friction := 10

func _update(delta):
	var direction := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	body.direction = direction if not direction == 0 else body.direction
	var step : float = acceleration if not direction == 0 else friction
	var should_accelerate := not direction == sign(body.velocity.x) or abs(body.velocity.x) < speed
	body.velocity.x = move_toward(body.velocity.x, direction * speed, step) if should_accelerate else body.velocity.x


