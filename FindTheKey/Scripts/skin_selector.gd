extends Control

func _on_penguin_button_pressed():
	Global.skin = "res://Scenes/penguin_player.tscn"
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_chicken_button_pressed():
	Global.skin = "res://Scenes/chicken_player.tscn"
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
