extends RigidBody2D

var score = 0

func _ready():
	pass

func _process(delta):
	score = int(position.x / 50) - 8
	$CanvasLayer/Score.text = "Score: " + str(score)
	if Input.is_action_just_pressed("ClickL"):
		if sleeping:
			leap()
	update_visuals()
	if position.x < get_parent().get_node("BoundryMonster").position.x:
		get_tree().reload_current_scene()
	if position.x - get_parent().get_node("BoundryMonster").position.x < 4000:
		$Camera2D.shake(0.5, 20, 40 - ((position.x - get_parent().get_node("BoundryMonster").position.x)/100))
		if position.x - get_parent().get_node("BoundryMonster").position.x < 2000:
			var opacity = 255 - (255 / (position.x - get_parent().get_node("BoundryMonster").position.x)) + 1
			$CanvasLayer/ColorRect.modulate = Color(255, 255, 255, opacity)

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
