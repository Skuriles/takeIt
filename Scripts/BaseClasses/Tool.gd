extends Resource
class_name Tools

export var alias: String
export var description: String
export var price_new: int
export var price_sell: int
export var image: Image
export var allowed_types = []
export var type_times = {}


func get_time(_interact: Interactive):
	pass
	# var intVal = interact.type
	# match intVal:
	# 	EInteractiveTypes.Door_Wooden:
	# 		return 15
	# 	EInteractiveTypes.Door_Iron:
	# 		return 30
	# 	# EInteractiveTypes.Window = 2,
	# 	# EInteractiveTypes.Desk = 3,
	# 	# EInteractiveTypes.Closet = 4,
	# 	# EInteractiveTypes.Safe = 5,
	# 	# EInteractiveTypes.Big_Safe = 6,
	# 	# EInteractiveTypes.Security = 7,
	# 	# EInteractiveTypes.Security_High = 8,
	# 	# EInteractiveTypes.Power = 9,
	# 	# EInteractiveTypes.Fridge = 10
	# 	# 	return 100
