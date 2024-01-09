extends Node2D

@onready var dialog = $Dialog

func _ready():
	dialog.visible = false

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player" && not body.has_fish():
		dialog.visible = true


func _on_area_2d_body_exited(body):
	if body.get_name() == "Player" && not body.has_fish():
		dialog.visible = false
