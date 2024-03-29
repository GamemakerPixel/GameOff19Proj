extends Control



func _ready():
	$AnimationPlayer.play("mainmenu")

func _on_Play_pressed():
	get_tree().change_scene("res://GameOff19Proj/Levels/RGLevel.tscn")

func _on_Modes_pressed():
	get_tree().change_scene("res://GameOff19Proj/Menus/Modes.tscn")

func _on_Metals_pressed():
	get_tree().change_scene("res://GameOff19Proj/Menus/Medals.tscn")

func _on_Custom_pressed():
	get_tree().change_scene("res://GameOff19Proj/Menus/CustomGame.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Music_finished():
	$Music.play()
