extends Node
class_name PlayerBase

var prey = []
var skills = []
var tools = []
var cars = []
var gender = true

var alias: String

var mainCharBodyIndices: Array = [0, 0, 0, 0, 0, 0, 0]


func init_player():
	tools = ToolsBase.get_tool_basic()
