extends CharacterBody2D
class_name Player

const SPEED = 400.0

func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * SPEED
	move_and_slide()
