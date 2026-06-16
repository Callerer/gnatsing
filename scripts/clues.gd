extends Node

@onready var clue1 = $clue1/Label
@onready var clue2 = $clue2/Label
@onready var clue3 = $clue3/Label
@onready var clue4 = $clue4/Label
@onready var clue5 = $clue5/Label
@onready var clue6 = $clue6/Label
@onready var clue7 = $clue7/Label

func _on_clue_1_body_entered(body: Node2D) -> void:
	if body is Player:
		clue1.visible = true

func _on_clue_2_body_entered(body: Node2D) -> void:
	if body is Player:
		clue2.visible = true
		
func _on_clue_3_body_entered(body: Node2D) -> void:
	if body is Player:
		clue3.visible = true
		
func _on_clue_4_body_entered(body: Node2D) -> void:
	if body is Player:
		clue4.visible = true
		
func _on_clue_5_body_entered(body: Node2D) -> void:
	if body is Player:
		clue5.visible = true
		
func _on_clue_6_body_entered(body: Node2D) -> void:
	if body is Player:
		clue6.visible = true
		
func _on_clue_7_body_entered(body: Node2D) -> void:
	if body is Player:
		clue7.visible = true
