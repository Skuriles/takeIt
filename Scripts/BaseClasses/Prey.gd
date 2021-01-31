extends Resource
class_name Prey

var rng = RandomNumberGenerator.new()

export var name: String
export var image: Image
export var minValue: int
export var maxValue: int
export var type: int  # EPreyTypes.Antique
export var weight: int
var value: int = calcValue()


func calcValue():
	rng.randomize()
	value = rng.randf_range(minValue, maxValue)
