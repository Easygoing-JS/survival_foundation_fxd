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
	},
	"healing_herb": {
		"name": "Healing Herb",
		"description": "Restores a small amount of health.",
		"stackable": true,
		"actions": ["use"],
		"effects": [{
				"type": "heal",
				 "amount": 20
				}
		]
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
