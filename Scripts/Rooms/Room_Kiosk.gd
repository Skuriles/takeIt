extends Node2D

signal camera_ready


func _ready():
	connect("camera_ready", $Camera2D, "set_player_node")
	emit_signal("camera_ready")
