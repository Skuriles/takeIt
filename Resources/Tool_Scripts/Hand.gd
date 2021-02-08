extends Tools

var res = load("res://Resources/Tools/Hand.tres")
func _ready():
	alias = res.alias
	image = res.image
	price_new  = res.price_new
    price_sell = res.price_sell
    allowed_types = res.allowed_types
    type_times = res.type_times,
    description = res.description

func allowed(interact: Interactive):
    var int_val = interact.type
    return allowed_types.has(int_val)

func get_time(interact: Interactive):    
    var intVal = interact.type
    match intVal:    	
    	EInteractiveTypes.Window:
            return 14    	
    	EInteractiveTypes.Security:
            return 55    	
    	EInteractiveTypes.Power:        
    		return 65
        _:
            return -1

func loudness(interact: Interactive):
    var intVal = interact.type
    match intVal: