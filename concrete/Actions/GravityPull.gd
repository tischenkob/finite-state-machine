extends Action

export var max_gravity_pull := 100

func _update(delta) -> void:
	body.velocity.y = move_toward(body.velocity.y, max_gravity_pull, 10)
