# inventory.gd

extends Node

signal updated

var items := {}

func add_item(item_id: String, amount: int = 1) -> void:
	var item_data = item_database.get_item_data(item_id)
	if item_data.is_empty():
		push_error("Trying to add unknown item: " + item_id)
		return

	if item_data.get("stackable", false):
		items[item_id] = items.get(item_id, 0) + amount
	else:
		for i in range(amount):
			var unique_id = item_id + "_" + str(Time.get_ticks_usec())
			items[unique_id] = 1

	emit_signal("updated")

func remove_item(item_id: String, amount: int = 1) -> void:
	if not items.has(item_id):
		return

	items[item_id] -= amount
	if items[item_id] <= 0:
		items.erase(item_id)

	emit_signal("updated")

func use_item(item_id: String) -> void:
	var item_data = item_database.get_item_data(item_id)
	if item_data.is_empty():
		return

	if item_data.has("effects"):
		for effect in item_data.effects:
			_apply_effect(effect)

	remove_item(item_id, 1)

func _apply_effect(effect: Dictionary) -> void:
	match effect.get("type", ""):
		"heal":
			var amount = effect.get("amount", 0)
			log_ui.add_message("You recovered " + str(amount) + " HP.", "info")
		_:
			log_ui.add_message("Unknown effect type: " + str(effect.get("type")), "warning")

func get_items() -> Dictionary:
	return items


#extends Node
#
#signal updated
#
#var items := {}
#
#func add_item(item_id: String, amount: int = 1) -> void:
	#var item_data = item_database.get_item_data(item_id)
	#if item_data.is_empty():
		#push_error("Trying to add unknown item: " + item_id)
		#return
#
	#if item_data.get("stackable", false):
		#items[item_id] = items.get(item_id, 0) + amount
	#else:
		#for i in range(amount):
			#var unique_id = item_id + "_" + str(Time.get_ticks_usec())
			#items[unique_id] = 1
#
	#emit_signal("updated")
	#log_ui.add_message("Picked up: " + item_id, "info")
#
#func remove_item(item_id: String, amount: int = 1) -> void:
	#if not items.has(item_id):
		#return
#
	#items[item_id] -= amount
	#if items[item_id] <= 0:
		#items.erase(item_id)
#
	#emit_signal("updated")
#
#func get_items() -> Dictionary:
	#return items
