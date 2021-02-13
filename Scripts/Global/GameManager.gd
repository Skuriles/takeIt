extends Node

const PlayerBase = preload("res://Scripts/BaseClasses/PlayerBase.gd")
var base_char


func _ready():
	base_char = PlayerBase.new()
	base_char.init_player()
