extends ColorRect



func appear(score):
	$AnimationPlayer.play("GameOver")
	$Score.text = "Score: " + str(score)

func disappear():
	self.hide()

func _on_Retry_pressed():
	get_parent().get_parent().get_parent().get_parent().reset()

func _on_Menu_pressed():
	get_tree().change_scene("res://GameOff19Proj/Menus/MainMenu.tscn")

func _on_Quit_pressed():
	get_tree().quit()