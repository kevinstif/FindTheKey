extends Node2D

@onready var chest = $Chest
@onready var playerScene = load(Global.skin)

var player : Player

func _ready():
	create_player()
	chest.visible = false
	

func create_player():
	player = playerScene.instantiate()
	player.position = $SpawnZone.position
	add_child(player)
	var joystick = $GUI.get_joystick()
	player.receive_joystick(joystick)

func _on_npc_fish_delivered():
	chest.visible = true
	$Walls/Wall2.queue_free()
