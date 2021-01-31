extends KinematicBody2D

export (int) var speed = 220

var velocity = Vector2()


func set_velocity(direction: int):
	velocity = Vector2()
	match direction:
		EDirections.WalkLeft:
			velocity.x += 1
		EDirections.WalkRight:
			velocity.x -= 1
		EDirections.WalkDown:
			velocity.y += 1
		EDirections.WalkUp:
			velocity.y -= 1
	velocity = velocity.normalized() * speed


func move_left(distance):
	set_velocity(EDirections.WalkLeft)


func _process(delta):
	move_and_slide(velocity)
