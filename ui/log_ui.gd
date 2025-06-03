extends CanvasLayer

@onready var container = $LogBox
var log_message_scene := preload("res://ui/log_message.tscn")

func add_message(message: String, type: String = "info") -> void:
	var log_msg = log_message_scene.instantiate()
	container.add_child(log_msg)
	log_msg.setup(message, type)




#func add_message(text: String) -> void:
	#show()
#
	#var label = Label.new()
	#label.text = text
	#label.modulate.a = 0.85
	#log_box.add_child(label)
#
	## Удаление через DISPLAY_TIME секунд
	#await get_tree().create_timer(DISPLAY_TIME).timeout
	#if is_instance_valid(label):
		#label.queue_free()
#
	## Скрыть лог, если всё удалено
	#if log_box.get_child_count() == 1:  # последний
		#await get_tree().create_timer(0.2).timeout
		#if log_box.get_child_count() == 0:
			#hide()
