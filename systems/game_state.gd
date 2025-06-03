extends Node
class_name GameState

var flags := {}
var reputation := {}
var choices := []

func set_flag(_name: String, value: bool):
	flags[name] = value

func get_flag(_name: String) -> bool:
	return flags.get(name, false)

func add_choice(text: String):
	choices.append(text)
