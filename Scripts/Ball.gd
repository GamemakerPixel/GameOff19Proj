extends RigidBody2D



func _process(delta):
	if Input.is_action_just_pressed("ClickL"):
		leap()

func leap():
	var Velocity
	look_at(get_global_mouse_position())
	if sleeping:
		Velocity = get_local_mouse_position()
		sleeping = false
	apply_central_impulse(Velocity.rotated(rotation))
	print(Velocity)

func _on_DetectCollision_body_entered(body):
	if body.get_parent().name == "Platforms":
		linear_velocity = Vector2(0, 0)
		angular_velocity = 0
		applied_force = Vector2(0, 0)
		linear_velocity = Vector2(0, 0)
		sleeping = true