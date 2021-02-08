extends Interactive


func _ready():
	alias = "DOOR_WOOD"
	image = load("res://Assets/InteractiveImages/door_wood.png")
	has_prey = false
	is_open = false
	is_locked = true
	description = "DOOR_WOOD_DESC"
	type = EInteractiveTypes.Door_Wooden
