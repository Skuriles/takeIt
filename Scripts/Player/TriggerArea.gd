extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent() as KinematicBody2D
onready var animPlayer = get_parent().find_node("AnimationPlayer") as AnimationPlayer

var player_old_z_index = 0
var body_old_index = 0
var wall_old_index = 0
var counter: int = 0
var wall_counter: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	player_old_z_index = player.z_index
	var _result = connect("body_entered", self, "_on_tilemap_enter")
	var _result2 = connect("body_exited", self, "_on_tilemap_exit")


func _on_tilemap_enter(body):
	if body.is_in_group("objects"):
		print(body)
		body_old_index = body.z_index
		counter += 1
		player.z_index = body.z_index + 100
		# body.z_index = player.z_index - 1
	if body.is_in_group("walls"):
		wall_old_index = body.z_index
		wall_counter += 1
		player.z_index = body.z_index + 100
		#body.z_index = player.z_index - 1


func _on_tilemap_exit(body):
	if body.is_in_group("objects"):
		print(body)
		counter -= 1
		if counter == 0:
			#body.z_index = body_old_index
			player.z_index = player_old_z_index
	if body.is_in_group("walls"):
		wall_counter -= 1
		if wall_counter == 0:
			#body.z_index = wall_old_index
			player.z_index = player_old_z_index
