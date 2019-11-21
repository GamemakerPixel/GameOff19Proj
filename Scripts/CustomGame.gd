extends Control

var dbp = GlobalVariables.gameGenerationSettings[0]
var pnsp = GlobalVariables.gameGenerationSettings[1]
var mps = GlobalVariables.gameGenerationSettings[2]
var pmr = GlobalVariables.gameGenerationSettings[3]
var bss = GlobalVariables.gameGenerationSettings[4]
var ba = GlobalVariables.gameGenerationSettings[5]

func _ready():
	setValue("DBP", dbp / 10, 0, 10)
	setValue("PnSP", -pnsp + 100, 1)
	setValue("MPS", mps, 2)
	setValue("PMR", pmr, 3)
	setValue("BSS", bss, 4)
	setValue("BA", ba / 0.1, 5, 0.1)

func setValue(slider, value, settingPosition, multiplier = 1):
	var sliderNode = get_node("VBoxContainer/" + slider)
	var valueLabel = sliderNode.get_node("Value")
	sliderNode.value = value
	valueLabel.text = str(value * multiplier)
	var trueValue = value * multiplier
	if slider == "PnSP":
		GlobalVariables.gameGenerationSettings[settingPosition] = 100 - trueValue
	else:
		GlobalVariables.gameGenerationSettings[settingPosition] = trueValue

func _on_DBP_value_changed(value):
	setValue("DBP", value, 0, 10)

func _on_PnSP_value_changed(value):
	setValue("PnSP", value, 1)

func _on_MPS_value_changed(value):
	setValue("MPS", value, 2)

func _on_PMR_value_changed(value):
	setValue("PMR", value, 3)

func _on_BSS_value_changed(value):
	setValue("BSS", value, 4)

func _on_BA_value_changed(value):
	setValue("BA", value, 5, 0.1)

func _on_Back_pressed():
	get_tree().change_scene("res://GameOff19Proj/Menus/MainMenu.tscn")

func _on_Play_pressed():
	get_tree().change_scene("res://GameOff19Proj/Levels/RGLevel.tscn")
