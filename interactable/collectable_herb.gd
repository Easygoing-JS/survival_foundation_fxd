# collectable_herb.gd

extends "res://interactable/interactable.gd"

func _ready():
	super._ready()
	if not interacted.is_connected(_on_interacted):
		interacted.connect(_on_interacted)

func _on_interacted():
	inventory.add_item("healing_herb")
	queue_free()
