extends GridContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var main = get_parent()


func _on_RotateLeft_pressed():
	main.rotatePlayer(false)


func _on_RotateRight_pressed():
	main.rotatePlayer(false)


func _on_ToggleArmsPrev_pressed():
	main.updateArms(false)


func _on_ToggleArmsNext_pressed():
	main.updateArms(true)


func _on_ToggleUpperPrev_pressed():
	main.updateUpper(false)


func _on_ToggleUpperNext_pressed():
	main.updateUpper(true)


func _on_ToggleLowerPrev_pressed():
	main.updateLower(false)


func _on_ToggleLowerNext_pressed():
	main.updateLower(true)


func _on_ToggleshoesPrev_pressed():
	main.updateShoes(false)


func _on_ToggleShoesNext_pressed():
	main.updateShoes(true)


func _on_ToggleHairPrev_pressed():
	main.updateHair(false)


func _on_ToggleHairNext_pressed():
	main.updateHair(true)


func _on_ToggleMoustachePrev_pressed():
	main.updateMoustache(false)


func _on_ToggleMoustacheNext_pressed():
	main.updateMoustache(true)
