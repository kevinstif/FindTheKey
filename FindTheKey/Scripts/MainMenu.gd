extends Control


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/map_1.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_skin_pressed():
	get_tree().change_scene_to_file("res://Scenes/skin_selector.tscn")