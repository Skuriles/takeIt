extends Interactive

var my_prey = load("res://Resources/Prey/Cigarrettes.tres")


func _ready():
	alias = "CABINET"
	image = load("res://Assets/InteractiveImages/closet.png")
	has_prey = true
	is_locked = true
	is_open = false
	description = "CABINET_DESC"
	prey = my_prey
	type = EInteractiveTypes.Cabinet
