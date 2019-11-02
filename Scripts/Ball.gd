extends RigidBody2D



func _process(delta):
	if Input.is_action_just_pressed("ClickL"):
		if sleeping:
			leap()

func leap():
	look_at(get_global_mouse_position())
	sleeping = false
	var Velocity = get_local_mouse_position()
	apply_central_impulse(Velocity.rotated(rotation))
	print(Velocity)

func _on_DetectCollision_body_entered(body):
	if body.get_parent().name == "Platforms":
		linear_velocity = Vector2(0, 0)
		angular_velocity = 0
		applied_force = Vector2(0, 0)
		linear_velocity = Vector2(0, 0)
		sleeping = true