extends CanvasLayer

onready var prey_list = $PanelContainer/HSplitContainer/TabContainer/PreyTab/PreyTabGrid/PreyList
onready var prey_image = $PanelContainer/HSplitContainer/TabContainer/PreyTab/PreyTabGrid/PreyImage
onready var interact_list = $PanelContainer/HSplitContainer/TabContainer/InteractTab/InteractTabGrid/InteractList
onready var interact_image = $PanelContainer/HSplitContainer/TabContainer/InteractTab/InteractTabGrid/InteractImage
onready var description = $PanelContainer/HSplitContainer/Description


func _ready():
	pass


func init(interactables: Array, preyList: Array):
	for interact in interactables:
		var texture = ImageTexture.new()
		texture.create_from_image(interact.image)
		interact_list.add_item(tr(interact.alias), texture)
	for prey in preyList:
		var texture = ImageTexture.new()
		texture.create_from_image(prey.image)
		prey_list.add_item(tr(prey.alias), prey.image)
	selectInteractItem(0)
	selectPreyItem(0)


func selectInteractItem(index: int):
	if interact_list.get_item_count() > index:
		var ele = interact_list.select(index)
		#  TODO this with item_selected signal
		description = ele.description
		var texture = ImageTexture.new()
		texture.create_from_image(ele.image)
		interact_image = texture


func selectPreyItem(index: int):
	if prey_list.get_item_count() > index:
		var ele = prey_list.select(index)
		description = ele.description
		var texture = ImageTexture.new()
		texture.create_from_image(ele.image)
		prey_image = texture
