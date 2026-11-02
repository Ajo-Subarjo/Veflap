extends Control





func _on_play_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_quit_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
