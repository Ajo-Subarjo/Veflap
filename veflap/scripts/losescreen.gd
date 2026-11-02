extends Control




func _on_play_again_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
