extends Node

const Tool = preload("res://Scripts/BaseClasses/Tool.gd")
onready var allTools: Array = Array()


func _ready():
	var path = "res://Resources/Tools/"
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		elif (
			! file_name.begins_with(".")
			and ! file_name.ends_with(".import")
			and file_name.ends_with(".tres")
		):
			var toolRes = load(path + file_name) as Tools
			allTools.push_back(toolRes)
	dir.list_dir_end()
