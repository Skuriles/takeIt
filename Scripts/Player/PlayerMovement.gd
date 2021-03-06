extends KinematicBody2D

export (int) var speed = 220

onready var player = get_parent()
var velocity = Vector2()


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed


func _physics_process(_delta):
	if ! player.no_movement:
		get_input()
		var _move2 = move_and_slide(velocity)
