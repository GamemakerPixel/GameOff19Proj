extends ColorRect



func appear(score):
	$AnimationPlayer.play("GameOver")
	$Score.text = "Score: " + str(score)

func _on_Retry_pressed():
	get_tree().reload_current_scene()

func _on_Menu_pressed():
	print("MenuUnavaliable")

func _on_Quit_pressed():
	get_tree().quit()