extends Area2D

@onready var askpass = $password
@onready var report = $report

func _ready() -> void:
	askpass.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		askpass.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		askpass.visible = false
		report.text = ""

func _on_password_text_submitted(new_text: String) -> void:
	if new_text == "lpodva":
		var scene = load("res://endscene.tscn")
		get_tree().change_scene_to_packed.call_deferred(scene)
		
	else:
		report.text = "wrong!"
		askpass.text = ""
