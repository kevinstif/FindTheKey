extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction = 1
var random = RandomNumberGenerator.new()

func _ready():
	direction = random.randi_range(0,1)
	if direction == 0: direction = -1

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_wall_detector_body_entered(body):
	if body.get_name() == 'TileMap':
		direction *= -1
