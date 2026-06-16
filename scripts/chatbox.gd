extends Node

@onready var send = $Control/Send
@onready var msg = $Control/Message
@onready var display = $Control/Display

func _process(_delta: float) -> void:
	if msg.text:
		send.disabled = false
	else:
		send.disabled = true

func _on_send_pressed() -> void:
	display.text += str(msg.text,"\n")
	msg.text = ""

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			msg.release_focus()     
		
