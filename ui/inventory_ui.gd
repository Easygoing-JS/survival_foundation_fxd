extends CanvasLayer

@onready var panel = $Panel
@onready var grid = $Panel/VBoxContainer/GridContainer
#@onready var actions_container = $Panel/VBoxContainer/ActionsContainer

func _ready():
	inventory.updated.connect(_on_inventory_updated)
	_on_inventory_updated()
	hide()

func _process(_delta):
	if Input.is_action_just_pressed("inventory"):
		visible = not visible

func _on_inventory_updated():
	for child in grid.get_children():
		child.queue_free()

	for item_id in inventory.get_items().keys():
		var amount = inventory.items[item_id]
		var item_data = item_database.get_item_data(item_id)

		var hbox = HBoxContainer.new()

		var label = Label.new()
		var item_name = item_data.get("name", item_id)
		var stackable = item_data.get("stackable", false)

		label.text = item_name
		if stackable:
			label.text += " x" + str(amount)
		hbox.add_child(label)

		var actions = item_data.get("actions", [])
		if "use" in actions:
			var use_button = Button.new()
			use_button.text = "Use"
			use_button.pressed.connect(func(): inventory.use_item(item_id))
			hbox.add_child(use_button)

		grid.add_child(hbox)


#extends CanvasLayer
#
#@onready var panel = $Panel
#@onready var grid = $Panel/VBoxContainer/GridContainer
#@onready var actions_container = $Panel/VBoxContainer/ActionsContainer
#
#var selected_item_id: String = ""
#
#func _ready():
	#inventory.updated.connect(_on_inventory_updated)
	#_on_inventory_updated()
	#hide()
#
#func _process(_delta):
	#if Input.is_action_just_pressed("inventory"):
		#visible = not visible
#
#func _on_inventory_updated():
	#for child in grid.get_children():
		#child.queue_free()
#
	#for item_id in inventory.get_items().keys():
		#var amount = inventory.items[item_id]
		#var item_data = item_database.get_item_data(item_id)
#
		#var button = Button.new()
		#var item_name = item_data.get("name", item_id)
		#var stackable = item_data.get("stackable", false)
		#button.text = "%s x%d" % [item_name, amount] if stackable else item_name
		#button.pressed.connect(func(): _on_item_selected(item_id))
		#grid.add_child(button)
#
	#actions_container.visible = false
#
#func _on_item_selected(item_id: String):
	#selected_item_id = item_id
	#_show_item_actions(item_id)
#
#func _show_item_actions(item_id: String):
	#for child in actions_container.get_children():
		#child.queue_free()
#
	#var item_data = item_database.get_item_data(item_id)
	#if not item_data.has("actions"):
		#actions_container.visible = false
		#return
#
	#for action_name in item_data["actions"]:
		#var btn = Button.new()
		#btn.text = action_name.capitalize()
		#btn.pressed.connect(func(): _on_action_pressed(action_name, item_id))
		#actions_container.add_child(btn)
#
	#actions_container.visible = true
#
#func _on_action_pressed(action_name: String, item_id: String):
	#match action_name:
		#"eat":
			#inventory.remove_item(item_id, 1)
			#log_ui.add_message("You ate the %s." % item_id, "info")
		#"use":
			#log_ui.add_message("Used %s." % item_id, "info")
		#"equip":
			#log_ui.add_message("Equipped %s." % item_id, "info")
		#_:
			#log_ui.add_message("Performed '%s' on %s." % [action_name, item_id], "info")
