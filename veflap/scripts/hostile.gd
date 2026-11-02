extends Node2D


@export var on_screen = true
var paused := false

func _ready() -> void:
	$hostile_sprite.play("flapping")



func _process(delta: float) -> void:
	if paused:
		return 

	if on_screen:
		position.x -= 5

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	position.x = 1400.0
	reset_height()
	on_screen = false

func reset_height():
	position.y = height()

func height():
	return randf_range(50.0, 600.0)
