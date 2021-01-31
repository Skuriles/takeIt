const Prey = preload("res://Scripts/BaseClasses/Prey.gd")

var name: String
var priceNew: int
var priceSell: int
var image: Image
var allowedTypes = []
var typeTimes = {}


func get_time(prey: Prey):
	var intVal = prey.type
	match intVal:
		EPreyTypes.Antique:
			return 100
