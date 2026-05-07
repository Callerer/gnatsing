extends VBoxContainer

func _ready() -> void:
	console("Console ready.")
	console("...")
	

func console(text):
	var new_line = Label.new()
	new_line.text = text
	add_child(new_line)
	move_child(new_line, 0)
	
