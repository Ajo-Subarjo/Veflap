extends Node2D

var start_pos = 0
var max_position = 700
var min_position = -300


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion :
		#print(event.relative)
		position.y += event.relative.y
		position.y = clamp(position.y, min_position, max_position)
		#print(position.y)

func _ready() -> void:
	for child in get_children():
		child.position.y = tower_position()
		#print(child.position.y)

func _process(delta: float) -> void:
	
	for child in get_children():
		child.position.x += -2
		#print(child.position.y)

func reset_tower(id):
	var node = get_child(id-1)
	node.position.x = start_pos
	node.position.y = tower_position()


func tower_position():
	return randf_range(-450.0, 0.0)


func _on_tower_notifier_screen_exited(id: int) -> void:
	print(id)
	reset_tower(id)
