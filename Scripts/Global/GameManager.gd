extends Node

const PlayerBase = preload("res://Scripts/BaseClasses/PlayerBase.gd")
var baseChar


func _ready():
	baseChar = PlayerBase.new()
	baseChar.init_player()
