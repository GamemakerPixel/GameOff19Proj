extends AnimatedSprite

func _on_Area2D_body_entered(body):
	pass
	#if body.name == "Ball":
		#if not body.position.x - body.get_parent().get_node("BoundryMonster").position.x <= 1500:
			#body.position.x -= 1000
			#if body.position.x < 400:
				#body.position.x = 400
		#body.position.y = 654
		#body.sleeping = true
