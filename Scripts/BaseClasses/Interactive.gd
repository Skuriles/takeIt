extends Node
class_name Interactive

const Prey = preload("res://Scripts/BaseClasses/Prey.gd")

export var alias: String
export var image: Image
export var has_prey: bool
export var is_locked: bool
export var is_open: bool
export var description: String
export var type: int  # EInteractiveTypes
var prey: Prey
