extends Node2D

var point := 0
var paused := false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	UiAudio.fetch_audio()


func _process(delta: float) -> void:
	if paused:
		return 

	check_hostile_height()
	
	if Input.is_action_pressed("debug"):
		lose()

func _on_collision_detection(body: Node2D) -> void:
	lose()

func _on_point_counter(body: Node2D) -> void:
	point += 1
	$audio2.play()
	$Label.text = 'Point: '+str(point)


func check_hostile_height():
	var ha = $hostile_parent.get_child(0)
	var hb = $hostile_parent.get_child(1)
	var height_distance = abs(ha.global_position.y - hb.global_position.y)
	#print(height_distance)
	if height_distance > 150:
		if not ha.on_screen:
			ha.on_screen = true
		if not hb.on_screen:
			hb.on_screen = true
		return

	var target = null
	if not ha.on_screen:
		target = ha
	elif not hb.on_screen:
		target = hb
	else:
		target = null

	for i in 10:
		target.reset_height()
		print(i)
		if abs(ha.global_position.y - hb.global_position.y) > 150:
			print('distance more that 150')
			break

	target.on_screen = true

 
func lose(): 
	paused = true
	$Bird.paused = true
	$hostile_parent/hostile.paused = true
	$hostile_parent/hostile2.paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$losescreen/HBoxContainer/VBoxContainer/point.text = 'your point : ' + str(point)
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_EXPO)
	tween.tween_property($losescreen,"position", Vector2(0,0), 0.5)
