extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var paused := false

func _physics_process(delta: float) -> void:
	if paused:
		return 

	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.tween_property($bird_sprite, 'rotation', deg_to_rad(-5.0), 0.2 )
		$audio1.pitch_scale = randf_range(0.5, 1.5)
		$"audio1".play()
		$bird_sprite.play("flapping")

	move_and_slide()

func _process(delta: float) -> void:
	if paused:
		return 

	if position.y > 800:
		print('bird die')

	if velocity.y >= 200:
		$bird_sprite.play("idle")
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.tween_property($bird_sprite, 'rotation', deg_to_rad(40.0), 0.1)
