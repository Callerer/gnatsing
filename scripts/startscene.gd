extends Node

func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	var scene = load("res://scenes/lobby.tscn")
	get_tree().change_scene_to_packed.call_deferred(scene)
	
