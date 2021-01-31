extends Node

var body_sprites = []

var arm_sprites = []

var shoe_sprites = []

var lower_sprites = []

var upper_sprites = []

var hair_sprites = []

var moustache_sprites = []

var body_sprites_w = []

var arm_sprites_w = []

var shoe_sprites_w = []

var lower_sprites_w = []

var upper_sprites_w = []

var hair_sprites_w = []

var moustache_sprites_w = []


func _ready():
	createMale()
	createFemale()


func createMale():
	var path = "res://Assets/Characters/Male"
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		elif (
			! file_name.begins_with(".")
			and ! file_name.ends_with(".import")
			and file_name.ends_with(".png")
		):
			if "Body" in file_name:
				body_sprites.append(load(path + "/" + file_name))
			if "Arm" in file_name:
				arm_sprites.append(load(path + "/" + file_name))
			if "Shoe" in file_name:
				shoe_sprites.append(load(path + "/" + file_name))
			if "Lower" in file_name:
				lower_sprites.append(load(path + "/" + file_name))
			if "Upper" in file_name:
				upper_sprites.append(load(path + "/" + file_name))
			if "Hair" in file_name:
				hair_sprites.append(load(path + "/" + file_name))
			if "Moustache" in file_name:
				moustache_sprites.append(load(path + "/" + file_name))
	dir.list_dir_end()


func createFemale():
	var path = "res://Assets/Characters/Female"
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		elif (
			! file_name.begins_with(".")
			and ! file_name.ends_with(".import")
			and file_name.ends_with(".png")
		):
			if "Body" in file_name:
				body_sprites_w.append(load(path + "/" + file_name))
			if "Arm" in file_name:
				arm_sprites_w.append(load(path + "/" + file_name))
			if "Shoe" in file_name:
				shoe_sprites_w.append(load(path + "/" + file_name))
			if "Lower" in file_name:
				lower_sprites_w.append(load(path + "/" + file_name))
			if "Upper" in file_name:
				upper_sprites_w.append(load(path + "/" + file_name))
			if "Hair" in file_name:
				hair_sprites_w.append(load(path + "/" + file_name))
			if "Moustache" in file_name:
				moustache_sprites_w.append(load(path + "/" + file_name))
	dir.list_dir_end()
