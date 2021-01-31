extends Camera2D

onready var playerNode = get_parent().find_node("Player")
onready var player = playerNode.get_node("KinematicBody2D")


func set_player_node():
	set_new_node(player)


func set_new_node(node: Node2D):
	get_parent().remove_child(self)
	node.add_child(self)
	current = true
