extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var moneys = 0
var fish = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	animation(direction)

	move_and_slide()

func has_fish():
	return fish

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
		print(moneys)
		var coinSound = $CoinSound
		coinSound.playing = true
	elif  body.get_name().find('Fish') != -1:
		fish = true
		body.queue_free()
		var fishSound = $FishSound
		fishSound.playing = true

func _on_damage_body_entered(body):
	if body.get_name().find('Fire') != -1:
		get_tree().reload_current_scene()
