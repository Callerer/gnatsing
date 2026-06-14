extends Node

@onready var host = $UI/VBoxContainer/NetworkOprions/Host
@onready var join = $UI/VBoxContainer/NetworkOprions/Connect
@onready var username = $UI/VBoxContainer/NetworkOprions/Name

var player_name = ""
@export var player_scene: PackedScene

func _ready() -> void:
	multiplayer.peer_connected.connect(peer_connect_callback)
	
# when peer joins
func  peer_connect_callback(id):
	$UI/VBoxContainer/InGameConsole.console("Player with id %d has joined."%[id])

#console log for ALL instances [awesome concept of rpc btw!]
@rpc("any_peer","call_local")
func rpc_console_log(text):
	$UI/VBoxContainer/InGameConsole.console(text)
	

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ENTER:
			chat()
			
		
	
func _on_host_pressed() -> void:
	# create a multiplayer instance
	var peer = ENetMultiplayerPeer.new()
	
	# create a server
	peer.create_server(12077)
	
	# check if connected or not
	if(peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED):
		OS.alert("Failed to connect")
		return
	
	multiplayer.multiplayer_peer = peer
	print("Starting game as a server")
	_add_player()
	start_game()
	joined()


func _on_connect_pressed() -> void:
	# create a multiplayer instance
	var peer = ENetMultiplayerPeer.new()
	
	# create a server
	peer.create_client("127.0.0.1",12077)
	
	# check if connected or not
	if(peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED):
		OS.alert("Failed to connect")
		return
	
	multiplayer.multiplayer_peer = peer
	print("Starting game as a client")
	_add_player()
	start_game()
	joined()

func  _add_player():
	var player = player_scene.instantiate()
	call_deferred("add_child",player)
	
func start_game():
	player_name = $UI/VBoxContainer/NetworkOprions/Name.text
	
func chat():
	var chatbox = $UI/VBoxContainer/ChatBox
	var chatbox_string = chatbox.text
	chatbox.clear()
	chatbox_string = player_name + ": " + chatbox_string
	rpc_console_log.rpc(chatbox_string)

func joined():
	host.hide()
	join.hide()
	username.hide()
