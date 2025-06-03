# player.gd

extends CharacterBody2D

const SPEED := 200

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	velocity = input_vector.normalized() * SPEED
	move_and_slide()
