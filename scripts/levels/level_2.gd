extends Node

@onready var clue2 = $clue2/Label

func _physics_process(_delta: float) -> void:
	var pos = $Player.position.y
	print(pos)
	if pos >= 2300:
		get_tree().reload_current_scene()

func _on_clue_2_body_entered(body: Node2D) -> void:
	if body is Player:
		clue2.visible = true

func _on_clue_2_body_exited(body: Node2D) -> void:
	if body is Player:
		clue2.visible = false

func _on_exit_body_entered(body: Node2D) -> void:
	if body is Player:
		Transitionscreen.transition()
		await Transitionscreen.on_transition_finished
		var scene = load("res://scenes/levels/level_3.tscn")
		get_tree().change_scene_to_packed.call_deferred(scene)
