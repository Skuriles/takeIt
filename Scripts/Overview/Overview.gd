extends Node2D


func _ready():
	$Player.stop_animation()
	$Player.disable_movement(true)
	$Player.set_body_frame(0)
	$Camera2D.set_new_node(self)
