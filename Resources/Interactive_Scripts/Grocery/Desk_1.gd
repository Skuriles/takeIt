extends Interactive

var my_prey = load("res://Resources/Prey/Money_100.tres")


func _ready():
	alias = "DESK"
	image = load("res://Assets/InteractiveImages/desk.png")
	has_prey = true
	is_locked = false
	is_open = false
	description = "DESK_DESC"
	prey = my_prey
	type = EInteractiveTypes.Desk
