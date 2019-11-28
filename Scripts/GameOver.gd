extends ColorRect



func appear(score):
	$AnimationPlayer.play("GameOver")
	$Score.text = "Score: " + str(score)
	get_parent().get_parent().onGameOver = true

func disappear():
	get_tree().reload_current_scene()

func _on_Retry_pressed():
	disappear()
	get_parent().get_parent().get_parent().get_parent().reset()

func _on_Menu_pressed():
	get_tree().change_scene("res://GameOff19Proj/Menus/MainMenu.tscn")

func _on_Quit_pressed():
	get_tree().quit()