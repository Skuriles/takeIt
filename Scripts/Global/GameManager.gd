extends Node

const BaseChar = preload("res://Scripts/BaseClasses/PlayerBase.gd")
var baseChar


func _ready():
	baseChar = BaseChar.new()
