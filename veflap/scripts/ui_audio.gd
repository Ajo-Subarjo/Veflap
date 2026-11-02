extends Node

var audio_player

func _ready() -> void:
	fetch_audio()
	audio_player = AudioStreamPlayer.new()
	audio_player.stream = load("res://assets/cozy_fx_22.ogg")
	audio_player.pitch_scale = .5

func fetch_audio():
	var nodes = get_tree().get_nodes_in_group('button')
	for node in nodes:
		node.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	add_child(audio_player)
	audio_player.play()
