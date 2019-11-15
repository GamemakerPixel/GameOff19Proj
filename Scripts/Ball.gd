extends RigidBody2D

var score = 0
var onGameOver = false
var startSleeping = true

func _ready():
	pass

func _process(delta):
	if startSleeping:
		sleeping = true
		startSleeping = false
	if Input.is_action_pressed("ui_up"):
		position.x += 1000
	score = int(position.x / 50) - 8
	$CanvasLayer/Score.text = "Score: " + str(score)
	if Input.is_action_just_pressed("ClickL"):
		if sleeping:
			leap()
	update_visuals()
	if position.x < get_parent().get_node("BoundryMonster").position.x:
		if not onGameOver:
			$CanvasLayer/GameOver.appear(score)
			onGameOver = true
	if position.x - get_parent().get_node("BoundryMonster").position.x < 4000:
		$Camera2D.shake(0.5, 20, (40 - ((position.x - get_parent().get_node("BoundryMonster").position.x)/100))/4)
		if position.x - get_parent().get_node("BoundryMonster").position.x < 2550:
			var opacity = (2550 - (position.x - get_parent().get_node("BoundryMonster").position.x)) / 10
			print(opacity)
			$CanvasLayer/ColorRect.color = Color8(255, 15, 15, opacity)
		else:
			$CanvasLayer/ColorRect.color = Color8(255, 15, 15, 0)
	if position.y > 904 || position.y < 404:
		shortReset()
	determineMedals()

func shortReset():
	if not position.x - get_parent().get_node("BoundryMonster").position.x <= 1500:
		position.x -= 1000
		if position.x < 400:
			position.x = 400
	position.y = 654
	startSleeping = true

func determineMedals():
	if GlobalVariables.gameGenerationSettings == [500, 90, 5, 10, 10, 0.3]:
		if score >= 300:
			if not GlobalVariables.medalsUnlocked[0]:
				$CanvasLayer/Medal.region_rect.position = Vector2(0, 0)
				$CanvasLayer/Medal/Label.text = "Easy - Bronze"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[0] = true
		if score >= 500:
			if not GlobalVariables.medalsUnlocked[1]:
				$CanvasLayer/Medal.region_rect.position = Vector2(16, 0)
				$CanvasLayer/Medal/Label.text = "Easy - Silver"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[1] = true
		if score >= 700:
			if not GlobalVariables.medalsUnlocked[2]:
				$CanvasLayer/Medal.region_rect.position = Vector2(32, 0)
				$CanvasLayer/Medal/Label.text = "Easy - Gold"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[2] = true
	if GlobalVariables.gameGenerationSettings == [550, 85, 4.5, 15, 30, 0.4]:
		if score >= 300:
			if not GlobalVariables.medalsUnlocked[3]:
				$CanvasLayer/Medal.region_rect.position = Vector2(0, 16)
				$CanvasLayer/Medal/Label.text = "Medium - Bronze"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[3] = true
		if score >= 500:
			if not GlobalVariables.medalsUnlocked[4]:
				$CanvasLayer/Medal.region_rect.position = Vector2(16, 16)
				$CanvasLayer/Medal/Label.text = "Medium - Silver"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[4] = true
		if score >= 700:
			if not GlobalVariables.medalsUnlocked[5]:
				$CanvasLayer/Medal.region_rect.position = Vector2(32, 16)
				$CanvasLayer/Medal/Label.text = "Medium - Gold"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[5] = true
	if GlobalVariables.gameGenerationSettings == [600, 80, 4, 20, 50, 0.6]:
		if score >= 300:
			if not GlobalVariables.medalsUnlocked[6]:
				$CanvasLayer/Medal.region_rect.position = Vector2(0, 32)
				$CanvasLayer/Medal/Label.text = "Hard - Bronze"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[6] = true
		if score >= 500:
			if not GlobalVariables.medalsUnlocked[7]:
				$CanvasLayer/Medal.region_rect.position = Vector2(16, 32)
				$CanvasLayer/Medal/Label.text = "Hard - Silver"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[7] = true
		if score >= 700:
			if not GlobalVariables.medalsUnlocked[8]:
				$CanvasLayer/Medal.region_rect.position = Vector2(32, 32)
				$CanvasLayer/Medal/Label.text = "Hard - Gold"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[8] = true
		if score >= 1000:
			if not GlobalVariables.medalsUnlocked[9]:
				$CanvasLayer/Medal.region_rect.position = Vector2(0, 48)
				$CanvasLayer/Medal/Label.text = "PLATINUM"
				$CanvasLayer/Medal/AnimationPlayer.play("Medal")
				GlobalVariables.medalsUnlocked[9] = true

func update_visuals():
	var monToSelfDis = position.x - get_parent().get_node("BoundryMonster").position.x
	if monToSelfDis > 1000:
		$CanvasLayer/Tracker.scale = Vector2(1000/monToSelfDis, 1000/monToSelfDis)

func leap():
	print("LEAP")
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
