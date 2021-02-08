extends Tools

var res = load("res://Resources/Tools/Crowbar.tres")
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
    	EInteractiveTypes.Door_Wooden:
    		return 15
    	EInteractiveTypes.Door_Iron:
    		return 30
    	EInteractiveTypes.Window:
            return 10
    	EInteractiveTypes.Desk:
            return 15
    	EInteractiveTypes.Closet:
            return 12    	
    	EInteractiveTypes.Fridge:        
    		return 22
        _:
            return -1

func loudness(interact: Interactive):
    var intVal = interact.type
    match intVal: