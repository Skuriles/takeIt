extends Node2D

var bodyIndex = 0
var armIndex = 0
var upperIndex = 0
var lowerIndex = 0
var shoesIndex = 0
var hairIndex = 0
var moustacheIndex = 0
var frameIndex = 0

onready var maxIndices = getMaxIndices()
onready var maxFrames = getMaxFrames()


func _ready():
	$Player.stop_animation()
	$Player.disable_movement(true)
	$Player.set_body_frame(0)
	updatePlayerBody()
	$Camera2D.set_new_node(self)


func _on_StartGame_pressed():
	var changed = get_tree().change_scene("res://Scenes//Overview.tscn")
	print(changed)


func getMaxIndices():
	if $Player.base_char.gender:
		return [
			CompositeSprites.body_sprites.size() - 1,
			CompositeSprites.arm_sprites.size() - 1,
			CompositeSprites.upper_sprites.size() - 1,
			CompositeSprites.lower_sprites.size() - 1,
			CompositeSprites.shoe_sprites.size() - 1,
			CompositeSprites.hair_sprites.size() - 1,
			CompositeSprites.moustache_sprites.size() - 1
		]
	else:
		return [
			CompositeSprites.body_sprites_w.size() - 1,
			CompositeSprites.arm_sprites_w.size() - 1,
			CompositeSprites.upper_sprites_w.size() - 1,
			CompositeSprites.lower_sprites_w.size() - 1,
			CompositeSprites.shoe_sprites_w.size() - 1,
			CompositeSprites.hair_sprites_w.size() - 1,
			CompositeSprites.moustache_sprites_w.size() - 1
		]


func getMaxFrames():
	return $Player/KinematicBody2D/BodySprites/Body.hframes


func updatePlayerBody():
	$Player.set_body_indices(
		[bodyIndex, armIndex, upperIndex, lowerIndex, shoesIndex, hairIndex, moustacheIndex]
	)


func setmale(male: bool):
	$Player.set_gender(male)
	maxIndices = getMaxIndices()
	checkBodyFrames()
	updatePlayerBody()
	if male:
		$Labels/Moustache.text = tr("MOUSTACHE")
	else:
		$Labels/Moustache.text = tr("LIPS")


func checkBodyFrames():
	if armIndex > maxIndices[1]:
		armIndex = 0
	if upperIndex > maxIndices[2]:
		upperIndex = 0
	if lowerIndex > maxIndices[3]:
		lowerIndex = 0
	if shoesIndex > maxIndices[4]:
		shoesIndex = 0
	if hairIndex > maxIndices[5]:
		hairIndex = 0
	if moustacheIndex > maxIndices[6]:
		moustacheIndex = 0


func rotatePlayer(right: bool):
	if right:
		if frameIndex >= maxFrames - 4:
			frameIndex = 0
		else:
			frameIndex += 4
	else:
		if frameIndex == 0:
			frameIndex = maxFrames - 4
		else:
			frameIndex -= 4
	$Player.set_body_frame(frameIndex)


func updateArms(next: bool):
	if next:
		if armIndex == maxIndices[1]:
			armIndex = 0
		else:
			armIndex += 1
	else:
		if armIndex == 0:
			armIndex = maxIndices[1]
		else:
			armIndex -= 1
	updatePlayerBody()


func updateUpper(next: bool):
	if next:
		if upperIndex == maxIndices[2]:
			upperIndex = 0
		else:
			upperIndex += 1
	else:
		if upperIndex == 0:
			upperIndex = maxIndices[2]
		else:
			upperIndex -= 1
	updatePlayerBody()


func updateLower(next: bool):
	if next:
		if lowerIndex == maxIndices[3]:
			lowerIndex = 0
		else:
			lowerIndex += 1
	else:
		if lowerIndex == 0:
			lowerIndex = maxIndices[3]
		else:
			lowerIndex -= 1
	updatePlayerBody()


func updateShoes(next: bool):
	if next:
		if shoesIndex == maxIndices[4]:
			shoesIndex = 0
		else:
			shoesIndex += 1
	else:
		if shoesIndex == 0:
			shoesIndex = maxIndices[4]
		else:
			shoesIndex -= 1
	updatePlayerBody()


func updateHair(next: bool):
	if next:
		if hairIndex == maxIndices[5]:
			hairIndex = 0
		else:
			hairIndex += 1
	else:
		if hairIndex == 0:
			hairIndex = maxIndices[5]
		else:
			hairIndex -= 1
	updatePlayerBody()


func updateMoustache(next: bool):
	if next:
		if moustacheIndex == maxIndices[6]:
			moustacheIndex = 0
		else:
			moustacheIndex += 1
	else:
		if moustacheIndex == 0:
			moustacheIndex = maxIndices[6]
		else:
			moustacheIndex -= 1
	updatePlayerBody()
