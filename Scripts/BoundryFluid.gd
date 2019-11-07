extends AnimatedSprite





func _on_Area2D_body_entered(body):
	if body.name == "Ball":
		body.position.x -= 1000
		body.position.y = 654
		body.sleeping = true