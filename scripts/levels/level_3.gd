extends Node

@onready var clue3 = $clue3/Label
@onready var clue4 = $clue4/Label
@onready var askpass = $exit/password
@onready var report = $exit/report

func _physics_process(_delta: float) -> void:
	var pos = $Player.position.y
	print(pos)
	if pos >= 1600:
		get_tree().reload_current_scene()

func _on_clue_3_body_entered(body: Node2D) -> void:
	if body is Player:
		clue3.visible = true

func _on_clue_3_body_exited(body: Node2D) -> void:
	if body is Player:
		clue3.visible = false

func _on_clue_4_body_entered(body: Node2D) -> void:
	if body is Player:
		clue4.visible = true

func _on_clue_4_body_exited(body: Node2D) -> void:
	if body is Player:
		clue4.visible = false	

func _on_exit_body_entered(body: Node2D) -> void:
	if body is Player:
		askpass.visible = true

func _on_password_text_submitted(new_text: String) -> void:
	if new_text == "msaz":
		Transitionscreen.transition()
		await Transitionscreen.on_transition_finished
		var scene = load("res://endscene.tscn")
		get_tree().change_scene_to_packed.call_deferred(scene)
	else:
		report.visible = true
		report.text = "wrong!"
		askpass.text = " "
