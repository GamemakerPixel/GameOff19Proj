extends Control



func _ready():
	if GlobalVariables.medalsUnlocked[0]:
		$E300.show()
	if GlobalVariables.medalsUnlocked[1]:
		$E500.show()
	if GlobalVariables.medalsUnlocked[2]:
		$E700.show()
	if GlobalVariables.medalsUnlocked[3]:
		$N300.show()
	if GlobalVariables.medalsUnlocked[4]:
		$N500.show()
	if GlobalVariables.medalsUnlocked[5]:
		$N700.show()
	if GlobalVariables.medalsUnlocked[6]:
		$H300.show()
	if GlobalVariables.medalsUnlocked[7]:
		$H500.show()
	if GlobalVariables.medalsUnlocked[8]:
		$H700.show()
	if GlobalVariables.medalsUnlocked[9]:
		$H1000.show()

func _on_Back_pressed():
	get_tree().change_scene("res://GameOff19Proj/Menus/MainMenu.tscn")

func _on_Music_finished():
	$Music.play()
