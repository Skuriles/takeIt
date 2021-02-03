extends Node
class_name Interactive

const Prey = preload("res://Scripts/BaseClasses/Prey.gd")

export var alias: String
export var image: Image
export var tools: Array
export var hasPrey: bool
var prey: Prey
