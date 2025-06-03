# --- item_database.gd ---

extends Node

# Autoload as "item_database"

var items = {
	"branch": {
		"name": "Branch",
		"description": "A simple wooden branch. Useful for crafting.",
		"stackable": true
	},
	"apple": {
		"name": "Apple",
		"description": "A fresh red apple. Restores a bit of health.",
		"stackable": true,
		"actions": ["eat"]
	}
}

func get_item_data(item_id: String) -> Dictionary:
	if items.has(item_id):
		return items[item_id]
	return {}




#func get_item_data(item_id: String) -> Dictionary:
	#if items.has(item_id):
		#return items[item_id]
	#return {}
