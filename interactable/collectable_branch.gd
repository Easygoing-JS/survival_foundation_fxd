# collectable_branch.gd

extends "res://interactable/interactable.gd"

func _ready():
	super._ready()
	if not interacted.is_connected(_on_interacted):
		interacted.connect(_on_interacted)

func _on_interacted():
	inventory.add_item("branch")
	queue_free()


#extends "res://interactable/interactable.gd"
#
#func _ready():
	#super._ready()
	#if not interacted.is_connected(_on_interacted):
		#interacted.connect(_on_interacted)
#
#func _on_interacted():
	#inventory.add_item("branch")
	#var log_ui = get_tree().root.get_node("Main/LogUI")
	#log_ui.add_message("[+] Picked up: Branch")
	#queue_free()
