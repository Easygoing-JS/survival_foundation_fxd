# interactable.gd

extends Area2D

signal interacted

@onready var label = $Label
var player_in_range = false

func _ready():
	label.visible = false
	if not is_connected("body_entered", _on_body_entered):
		connect("body_entered", _on_body_entered)
	if not is_connected("body_exited", _on_body_exited):
		connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.name == "Player":
		player_in_range = true
		label.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		label.visible = false

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		emit_signal("interacted")


#extends Area2D
#
#signal interacted
#
#@onready var label = $Label
#
#var player_in_range = false
#
#func _ready():
	#label.visible = false
	#if not is_connected("body_entered", _on_body_entered):
		#connect("body_entered", _on_body_entered)
	#if not is_connected("body_exited", _on_body_exited):
		#connect("body_exited", _on_body_exited)
#
#
#func _on_body_entered(body):
	#if body.name == "Player":
		#player_in_range = true
		#label.visible = true
#
#func _on_body_exited(body):
	#if body.name == "Player":
		#player_in_range = false
		#label.visible = false
#
#func _process(_delta):
	#if player_in_range and Input.is_action_just_pressed("interact"):
		#emit_signal("interacted")
