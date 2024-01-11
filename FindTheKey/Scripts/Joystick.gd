extends Area2D

@onready var rango = $Rango
@onready var palanca = $Palanca
@onready var radio = $CollisionShape2D.shape.radius
var distance: float
var direction: Vector2
var index:int  = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed() and index == -1:
			distance = global_position.distance_to(event.position)
			if distance < radio:
				index = event.index
				palanca.global_position = event.position
				direction = (global_position.direction_to(palanca.position) * distance) / radio
		elif event.index == index:
			index = -1
			palanca.position = Vector2.ZERO
			direction = Vector2.ZERO
			
	if event is InputEventScreenDrag:
		if event.index == index:
			distance = global_position.distance_to(event.position)
			if distance <= radio:
				palanca.global_position = event.position
				direction = (global_position.direction_to(palanca.global_position) * distance) / radio
			else:
				direction = global_position.direction_to(event.position)
				palanca.position = direction * radio
