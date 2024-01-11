extends CharacterBody2D


const SPEED = 100.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction: int
var random = RandomNumberGenerator.new()
@onready var raycast = $RayCast2D

func _ready():
	direction = random.randi_range(0,1)
	if direction == 0: direction = -1
	elif direction == 1: rotate_x()

func rotate_x():
	scale.x = - scale.x

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	turn()

func turn():
	if not $RayCast2D.is_colliding():
		direction *= -1
		rotate_x()

func _on_wall_detector_body_entered(body):
	if body.get_name() == 'TileMap' or body.get_name().find('Fire') != -1:
		direction *= -1
		rotate_x()
