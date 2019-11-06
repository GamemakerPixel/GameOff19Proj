extends RigidBody2D



func _process(delta):
	if Input.is_action_just_pressed("ClickL"):
		if sleeping:
			leap()
	update_visuals()

func update_visuals():
	var monToSelfDis = position.x - get_parent().get_node("BoundryMonster").position.x
	if monToSelfDis > 1000:
		$CanvasLayer/Tracker.scale = Vector2(1000/monToSelfDis, 1000/monToSelfDis)

func leap():
	var starting = true
	if starting:
		get_parent().get_node("BoundryMonster").ready = true
	look_at(get_global_mouse_position())
	sleeping = false
	var Velocity = get_local_mouse_position() * Vector2(gravity_scale / 1.2, gravity_scale / 1.2)
	apply_central_impulse(Velocity.rotated(rotation))

func _on_DetectCollision_body_entered(body):
	if body.get_parent().name == "Platforms":
		linear_velocity = Vector2(0, 0)
		angular_velocity = 0
		applied_force = Vector2(0, 0)
		linear_velocity = Vector2(0, 0)
		sleeping = true
