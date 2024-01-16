extends Area2D

@onready var animation = $AnimationPlayer
@onready var gem = $Gem 
var close = true

func _ready():
	gem.visible = false 

func _on_body_entered(body):
	if visible and body.get_name().find('Player') != -1 and close:
		close = false
		animation.play("open")
		await get_tree().create_timer(0.3).timeout
		gem.visible = true
		gem.start_animation()
		
