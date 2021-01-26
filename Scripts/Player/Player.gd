extends Node2D

onready var bodySprite = $KinematicBody2D/BodySprites/Body
onready var shoesSprite = $KinematicBody2D/BodySprites/Shoes
onready var armSprite = $KinematicBody2D/BodySprites/Arms
onready var lowerSprite = $KinematicBody2D/BodySprites/Lower
onready var upperSprite = $KinematicBody2D/BodySprites/Upper
onready var hairSprite = $KinematicBody2D/BodySprites/Hair
onready var moustachSprite = $KinematicBody2D/BodySprites/Moustache

onready var animatedSprite = $KinematicBody2D/BodySprites/AnimationPlayer

var LastDirection = EDirections.IdleDown

var animationAllowed = true

func _ready():
	var array = GameManager.mainCharBodyIndices
	setBodyIndices(array)			
	animatedSprite.stop()
	
func _process(_delta):
	if animationAllowed:
		detectInput();
		selectAnimation();		
	
func setBodyFrame(index: int):
	bodySprite.frame = index
	armSprite.frame = index
	upperSprite.frame = index
	lowerSprite.frame = index
	shoesSprite.frame = index
	hairSprite.frame = index
	moustachSprite.frame = index

func setBodyIndices(spriteIndex: Array):	
	# think about to make a bool flag when to use it globally:
	GameManager.mainCharBodyIndices = spriteIndex
	bodySprite.texture = CompositeSprites.body_sprites[spriteIndex[0]]
	armSprite.texture = CompositeSprites.arm_sprites[spriteIndex[1]]		
	upperSprite.texture = CompositeSprites.upper_sprites[spriteIndex[2]]
	lowerSprite.texture = CompositeSprites.lower_sprites[spriteIndex[3]]
	shoesSprite.texture = CompositeSprites.shoe_sprites[spriteIndex[4]]
	hairSprite.texture = CompositeSprites.hair_sprites[spriteIndex[5]]	
	moustachSprite.texture = CompositeSprites.moustache_sprites[spriteIndex[6]]	
	
func stopAnimation():
	animationAllowed = false
	
func detectInput():
	if Input.is_action_pressed("ui_left"):		
		LastDirection = EDirections.WalkLeft;			
		return;		
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_left"):
				LastDirection = EDirections.IdleDown
				return
		LastDirection = EDirections.WalkRight
		return;	
	if Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_down"):
			LastDirection = EDirections.IdleDown;
			return;
		LastDirection = EDirections.WalkUp;
		return;
	if Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_top"):
			LastDirection = EDirections.IdleDown;
			return;
		LastDirection = EDirections.WalkDown;
		return;		
	else:
		match LastDirection:	
			EDirections.IdleDown, EDirections.IdleRight, EDirections.IdleUp, EDirections.IdleLeft:
				return
			EDirections.WalkDown:
				LastDirection = EDirections.IdleDown;
			EDirections.WalkUp:
				LastDirection = EDirections.IdleUp;
			EDirections.WalkLeft:
				LastDirection = EDirections.IdleLeft;
			EDirections.WalkRight:
				LastDirection = EDirections.IdleRight;
			_:
				animatedSprite.stop()			
	

func selectAnimation():				
	match LastDirection:
		EDirections.None,EDirections.IdleDown:			
			if animatedSprite.current_animation != "Idle_down":				
				animatedSprite.play("Idle_down")
		EDirections.IdleUp:
			if animatedSprite.current_animation != "Idle_up":	
				animatedSprite.play("Idle_up")
		EDirections.IdleLeft:
			if animatedSprite.current_animation != "Idle_left":				
				animatedSprite.play("Idle_left")
		EDirections.IdleRight:
			if animatedSprite.current_animation != "Idle_right":								
				animatedSprite.play("Idle_right")
		EDirections.WalkDown:			
			if animatedSprite.current_animation != "Walk_down":				
				animatedSprite.play("Walk_down")
		EDirections.WalkUp:			
			if animatedSprite.current_animation != "Walk_up":				
				animatedSprite.play("Walk_up")
		EDirections.WalkLeft:			
			if animatedSprite.current_animation != "Walk_left":				
				animatedSprite.play("Walk_left")
		EDirections.WalkRight:			
			if animatedSprite.current_animation != "Walk_right":				
				animatedSprite.play("Walk_right")	
		
