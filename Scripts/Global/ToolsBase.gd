extends Node

const Tool = preload("res://Scripts/BaseClasses/Tool.gd")
onready var all_tools: Dictionary


func _init():
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
			all_tools[toolRes.alias] = toolRes
	dir.list_dir_end()


func get_tool_basic():
	return [all_tools["CROWBAR"], all_tools["HAND"], all_tools["SCREWDRIVER"]]
