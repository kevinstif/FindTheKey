extends Node2D

@onready var chest = $Chest
@onready var playerScene = load(Global.skin)

var player : Player

func _ready():
	create_player()
	player.AddMoney.connect(update_moneys_score)
	player.AddGem.connect(update_gem_score)
	chest.visible = false
	
func update_moneys_score():
	$GUI/ScoreBoard.increment_money()

func update_gem_score():
	$GUI/ScoreBoard.increment_score()

func create_player():
	player = playerScene.instantiate()
	player.position = $SpawnZone.position
	add_child(player)
	var joystick = $GUI.get_joystick()
	player.receive_joystick(joystick)

func _on_npc_fish_delivered():
	chest.visible = true
	$Walls/Wall2.queue_free()
