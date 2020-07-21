extends Action

export var max_gravity_pull := 100

func _update(delta) -> void:
	_body.velocity.y = move_toward(_body.velocity.y, max_gravity_pull, 10)
