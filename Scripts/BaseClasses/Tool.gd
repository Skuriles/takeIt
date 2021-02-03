extends Resource
class_name Tools

export var name: String
export var priceNew: int
export var priceSell: int
export var image: Image
export var allowedTypes = []
export var typeTimes = {}


func get_time(prey: Prey):
	var intVal = prey.type
	match intVal:
		EPreyTypes.Antique:
			return 100
