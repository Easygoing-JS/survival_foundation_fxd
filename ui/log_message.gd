extends Control

#@onready var icon = $Icon
#@onready var label = $Label
#@onready var timer = $Timer

func setup(message: String, type: String = "info") -> void:
	var icon = $Icon
	var label = $Label
	var timer = $Timer

	label.text = message

	match type:
		"info":
			label.modulate = Color.WHITE
			icon.text = "ℹ️"
		"warning":
			label.modulate = Color.ORANGE
			icon.text = "⚠️"
		"error":
			label.modulate = Color.RED
			icon.text = "❌"
		_:
			label.modulate = Color.GRAY
			icon.text = "?"

	timer.start()

func _on_timer_timeout():
	queue_free()
