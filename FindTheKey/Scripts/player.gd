extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var moneys = 0
var fish = false
@onready var camera = $Camera2D 
@onready var score = $GUI/ScoreBoard
@onready var controls = $GUI/Joystick

func _physics_process(delta):
	jump(delta)
	move_joystick()
	#move_key(delta)
	move_and_slide()

func move_joystick():
	var direction = controls.direction.x
	
	if direction > 0: direction = 1
	elif direction < 0: direction = -1
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	animation(direction)

func jump(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func move_key():
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	animation(direction)

func has_fish():
	return fish

func deliver_fish():
	if has_fish():
		fish = false
		var fishSound = $FishSound
		fishSound.playing = true
		camera.limit_right = 3190

func animation(direction: float):
	var sprite = $Sprite2D
	var animationPlayer = $AnimationPlayer
	if direction == 1:
		sprite.flip_h = false
		animationPlayer.play("walk")
	elif direction == -1:
		sprite.flip_h = true
		animationPlayer.play("walk")
	else:
		animationPlayer.play("idle")

func _on_collector_body_entered(body):
	if body.get_name().find('Coin') != -1:
		moneys += 1
		body.queue_free()
		var coinSound = $CoinSound
		coinSound.playing = true
		score.update_money(moneys)
	elif  body.get_name().find('Fish') != -1:
		fish = true
		body.queue_free()
		var fishSound = $FishSound
		fishSound.playing = true
	elif  body.get_name().find('Gem') != -1 and body.visible:
		body.queue_free()
		var fishSound = $FishSound
		fishSound.playing = true

func _on_damage_body_entered(body):
	if body.get_name().find('Fire') != -1:
		get_tree().reload_current_scene()
