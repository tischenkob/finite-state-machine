extends KinematicBody2D

onready var state_machine := $PlayerStateMachine

var velocity := Vector2.ZERO
var direction := 1

func _physics_process(delta):
	var collision := move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.normal)
	var next_state := "OnGround" if collision else "InAir"
	state_machine._change_state(next_state)
