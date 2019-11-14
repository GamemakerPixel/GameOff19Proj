extends AnimatedSprite

func _on_Area2D_body_entered(body):
	if body.name == "Ball":
		body.position.x -= 500
		if body.position.x < 400:
			body.position.x = 400
		body.position.y = 654
		body.sleeping = true