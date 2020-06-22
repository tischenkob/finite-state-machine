extends KinematicBody2D

var vel := Vector2.ZERO

func _physics_process(delta):
	move_and_slide(vel)
