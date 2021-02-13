extends CanvasLayer

onready var interact_list = $PanelContainer/MarginContainer/BaseGrid/InteractList
onready var tool_list = $PanelContainer/MarginContainer/BaseGrid/ToolList
onready var interact_image = $PanelContainer/MarginContainer/BaseGrid/InteractImage
onready var description = $PanelContainer/MarginContainer/BaseGrid/Description
onready var viewPortContainer = $PanelContainer/MarginContainer/BaseGrid/ViewportContainer
onready var viewPort = $PanelContainer/MarginContainer/BaseGrid/ViewportContainer/Viewport

signal interactive_selected(interactive)


func _ready():
	pass


func init(interactables: Array, preyList: Array):
	for prey in preyList:
		var texture = ImageTexture.new()
		texture.create_from_image(prey.image, 0)
		interact_list.add_item(tr(prey.alias), texture)
		interact_list.set_item_metadata(interact_list.get_item_count() - 1, prey)
	for interact in interactables:
		var texture = ImageTexture.new()
		texture.create_from_image(interact.image, 0)
		interact_list.add_item(tr(interact.alias), texture)
		interact_list.set_item_metadata(interact_list.get_item_count() - 1, interact)
	selectInteractItem(0)


func selectInteractItem(index: int):
	if interact_list.get_item_count() > index:
		# this does not fire signal, call manually
		interact_list.select(index)
		item_selected(index)


func _on_InteractList_item_selected(index: int):
	item_selected(index)


func _on_InteractList_item_activated(index: int):
	var interact = interact_list.get_item_metadata(index)
	emit_signal("interactive_selected", interact)


func set_tool_info(list: Array):
	viewPortContainer.visible = false
	interact_list.visible = false
	tool_list.visible = true
	interact_image.visible = true
	for ele in list:
		var texture = ImageTexture.new()
		texture.create_from_image(ele.image)
		tool_list.add_item(tr(ele.alias), texture)
		tool_list.set_item_metadata(tool_list.get_item_count() - 1, ele)
	tool_selected(0)


func tool_selected(index: int):
	var ele = tool_list.get_item_metadata(index)
	var infoStr = (
		tr("TIME")
		+ ": "
		+ str(ele.time)
		+ "\n"
		+ tr("LOUDNESS")
		+ ": "
		+ str(ele.loudness)
	)
	description.text = infoStr
	var texture = ImageTexture.new()
	texture.create_from_image(ele.image)
	interact_image.texture = texture


func _on_ToolList_item_selected(index: int):
	tool_selected(index)


func _on_ToolList_item_activated(index: int):
	var interact = tool_list.get_item_metadata(index)
	# emit_signal("interactive_selected", interact)


func item_selected(index: int):
	var ele = interact_list.get_item_metadata(index)
	if ele != null:
		description.text = tr(ele.description)
		var sprites = Array()
		var childs = ele.get_children()
		if childs == null or childs.size() == 0:
			return
		var first_sprite
		var minPosX = 500000
		var minPosY = 500000
		var moveOffsetX = -50000
		var moveOffsetY = -50000
		for child in childs:
			if child is Sprite:
				sprites.append(child)
				if (
					child.get_global_transform_with_canvas().origin.x < minPosX
					and child.get_global_transform_with_canvas().origin.y < minPosY
				):
					minPosX = child.get_global_transform_with_canvas().origin.x
					minPosY = child.get_global_transform_with_canvas().origin.y
					first_sprite = child
		var currentPosX = 0
		var currentPosY = 0
		var offsetX = first_sprite.get_global_transform_with_canvas().origin.x
		var offsetY = first_sprite.get_global_transform_with_canvas().origin.y

		for sprite in sprites:
			var newSprite = sprite.duplicate()
			newSprite.flip_h = sprite.flip_h
			newSprite.flip_v = sprite.flip_v
			currentPosX = sprite.get_global_transform_with_canvas().origin.x - offsetX
			currentPosY = sprite.get_global_transform_with_canvas().origin.y - offsetY
			newSprite.position = Vector2(currentPosX, currentPosY)
			if newSprite.position.x + newSprite.region_rect.size.x > moveOffsetX:
				moveOffsetX = newSprite.position.x + newSprite.region_rect.size.x
			if newSprite.position.y + newSprite.region_rect.size.y > moveOffsetY:
				moveOffsetY = newSprite.position.y + newSprite.region_rect.size.y
			newSprite.centered = false
			viewPort.add_child(newSprite)
