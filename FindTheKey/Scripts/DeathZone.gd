extends Area2D

func _on_body_entered(body):
	print(body.get_name())
	if body.get_name().find('Player') != -1:
		get_tree().reload_current_scene()
