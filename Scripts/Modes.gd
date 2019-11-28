extends Control



func _ready():
	if GlobalVariables.gameGenerationSettings == [500, 90, 5, 10, 10, 0.3]:
		selectButton(1)
	if GlobalVariables.gameGenerationSettings == [550, 85, 4.5, 15, 30, 0.4]:
		selectButton(2)
	if GlobalVariables.gameGenerationSettings == [600, 80, 4, 20, 50, 0.6]:
		selectButton(3)

func _on_Easy_pressed():
	selectButton(1)
	GlobalVariables.gameGenerationSettings = [500, 90, 5, 10, 10, 0.3]

func _on_Normal_pressed():
	selectButton(2)
	GlobalVariables.gameGenerationSettings = [550, 85, 4.5, 15, 30, 0.4]

func _on_Hard_pressed():
	selectButton(3)
	GlobalVariables.gameGenerationSettings = [600, 80, 4, 20, 50, 0.6]

func selectButton(button):
	if button == 1:
		$Buttons/Easy.add_color_override("font_color", Color8(255, 255, 255, 255))
		$Buttons/Easy.add_color_override("font_color_hover", Color8(255, 255, 255, 255))
		$Buttons/Normal.add_color_override("font_color", Color8(165, 0, 0, 255))
		$Buttons/Hard.add_color_override("font_color", Color8(165, 0, 0, 255))
	if button == 2:
		$Buttons/Normal.add_color_override("font_color", Color8(255, 255, 255, 255))
		$Buttons/Normal.add_color_override("font_color_hover", Color8(255, 255, 255, 255))
		$Buttons/Easy.add_color_override("font_color", Color8(165, 0, 0, 255))
		$Buttons/Hard.add_color_override("font_color", Color8(165, 0, 0, 255))
	if button == 3:
		$Buttons/Hard.add_color_override("font_color", Color8(255, 255, 255, 255))
		$Buttons/Hard.add_color_override("font_color_hover", Color8(255, 255, 255, 255))
		$Buttons/Normal.add_color_override("font_color", Color8(165, 0, 0, 255))
		$Buttons/Easy.add_color_override("font_color", Color8(165, 0, 0, 255))

func _on_Back_pressed():
	get_tree().change_scene("res://GameOff19Proj/Menus/MainMenu.tscn")

func _on_Music_finished():
	$Music.play()
