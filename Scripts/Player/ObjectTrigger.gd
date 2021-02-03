extends Area2D

var current_interactables
var current_prey


func _ready():
	current_interactables = Array()
	current_prey = Array()
	var _result = connect("body_entered", self, "_on_object_enter")
	var _result2 = connect("body_exited", self, "_on_object_exit")


func _on_object_enter(body):
	if body.is_in_group("interactable"):
		current_interactables.push_back(body)
	if body.is_in_group("prey"):
		current_prey.push_back(body)


func _on_object_exit(body):
	if body.is_in_group("interactable"):
		current_interactables.erase(body)
	if body.is_in_group("prey"):
		current_prey.erase(body)


func check_interactable():
	return current_interactables


func check_prey():
	return current_prey
