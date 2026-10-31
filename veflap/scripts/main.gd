extends Node2D

var point := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_collision_detection(body: Node2D) -> void:
	print(body, "bird die")


func _on_point_counter(body: Node2D) -> void:
	point += 1
	$Label.text = str(point)
