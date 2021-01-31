extends Area2D	


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent() as KinematicBody2D
onready var animPlayer = get_parent().find_node("AnimationPlayer") as AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():		
	connect("body_entered", self, "_on_tilemap_enter")
	connect("body_exited", self, "_on_tilemap_exit")

func _on_tilemap_enter(body):	
	if body is TileMap:		
			var tm = body as TileMap
			var name = tm.name
			match name:
				"Walls", "Objects", "Prey":					
						tm.z_index = 10

func _on_tilemap_exit(body):	
	if body is TileMap:
		var tm = body as TileMap
		var name = tm.name
		match name:
			"Walls", "Objects", "Prey":
				tm.z_index = 20		
		


