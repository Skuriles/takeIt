extends Node2D
class_name RoomBase

const BaseOverlay = preload("res://Scenes/BaseOverlay.tscn")


func showOverlay(interactables: Array, prey: Array):
	var overlay = $BaseOverlay
	if overlay != null:
		remove_child(overlay)
		overlay.queue_free()
		$Player.close_overlay()
		return
	overlay = BaseOverlay.instance()
	add_child(overlay)
	overlay.init(interactables, prey)
	var _sig = overlay.connect("interactive_selected", $Player, "interact_selected")
