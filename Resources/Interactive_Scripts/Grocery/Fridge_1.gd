extends Interactive

var my_prey = load("res://Resources/Prey/Delicatessen_1.tres")


func _ready():
	alias = "FRIDGE"
	image = load("res://Assets/InteractiveImages/fridge.png")
	has_prey = true
	is_locked = false
	is_open = false
	description = "FRIDGE_DESC"
	prey = my_prey
	type = EInteractiveTypes.Fridge
