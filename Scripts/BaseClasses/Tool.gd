extends Resource
class_name Tools

export var alias: String
export var description: String
export var price_new: int
export var price_sell: int
export var image: Image
export var allowed_types = []
export var type_times = {}
export var type_loudness = {}

var res: Resource


func _ready():
	alias = res.alias
	image = res.image
	price_new = res.price_new
	price_sell = res.price_sell
	allowed_types = res.allowed_types
	type_loudness = type_loudness
	type_times = res.type_times
	description = res.description


func get_time(interact: Interactive):
	var int_val = interact.type
	if allowed_types.has(int_val):
		return type_times[int_val]


func loudness(interact: Interactive):
	var int_val = interact.type
	if allowed_types.has(int_val):
		return type_loudness[int_val]
