extends Node2D

@onready var dialog = $Dialog

signal fish_delivered
var hungry:bool =  true

func _ready():
	dialog.visible = false

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		if body.has_fish():
			body.deliver_fish()
			hungry = false
			dialog.visible = false
			fish_delivered.emit()
		if hungry:
			dialog.visible = true


func _on_area_2d_body_exited(body):
	if body.get_name() == "Player" and hungry:
		dialog.visible = false
