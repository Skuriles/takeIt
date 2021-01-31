extends Node2D


func _ready():
	$Player.stopAnimation()
	$Player.disableMovement(true)
	$Player.setBodyFrame(0)
	$Camera2D.set_new_node(self)
