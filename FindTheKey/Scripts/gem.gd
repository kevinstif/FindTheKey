extends CharacterBody2D

@onready var animation = $AnimationPlayer

func start_animation():
	animation.play("move")
