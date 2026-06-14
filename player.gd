extends CharacterBody2D

const SPEED = 400

func  _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _physics_process(_delta: float) -> void:
	if !is_multiplayer_authority():
		return
	
	if get_viewport().gui_get_focus_owner() != null:
		return

	
	if is_multiplayer_authority():
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
