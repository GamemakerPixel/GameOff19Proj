extends AnimatedSprite





func _on_Area2D_body_entered(body):
	if body.name == "Ball":
		get_tree().reload_current_scene()
