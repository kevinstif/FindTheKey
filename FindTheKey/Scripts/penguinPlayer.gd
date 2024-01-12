extends Player

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
