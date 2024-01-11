extends Node2D

@onready var chest = $Chest

func _ready():
	chest.visible = false

func _on_npc_fish_delivered():
	chest.visible = true
	$Walls/Wall2.queue_free()

