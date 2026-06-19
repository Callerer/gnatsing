extends Node

@onready var clue0 = $clue0/Label
@onready var askpass = $exit/password

func _physics_process(_delta: float) -> void:
	var pos = $Player.position.y
	print(pos)
	if pos >= 2300:
		get_tree().reload_current_scene()

func _on_password_text_submitted(new_text: String) -> void:
	if new_text == "vamos!":
		Transitionscreen.transition()
		await Transitionscreen.on_transition_finished
		var scene = load("res://scenes/levels/level_1.tscn")
		get_tree().change_scene_to_packed.call_deferred(scene)

func _on_clue_0_body_entered(body: Node2D) -> void:
	if body is Player:
		clue0.visible = true
		
func _on_clue_0_body_exited(body: Node2D) -> void:
	if body is Player:
		clue0.visible = false

func _on_exit_body_entered(body: Node2D) -> void:
	if body is Player:
		askpass.visible = true

func _on_exit_body_exited(body: Node2D) -> void:
	if body is Player:
		askpass.visible = false
