extends Node

func _ready() -> void:
	multiplayer.peer_connected.connect(peer_connect_callback)

func _process(_delta: float) -> void:
	pass
	
func  peer_connect_callback(id):
	$UI/VBoxContainer/InGameConsole.console("Player with id %d has joined."%[id])
	
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
	
