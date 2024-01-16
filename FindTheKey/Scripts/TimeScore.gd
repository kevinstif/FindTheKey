extends Control

var timeScore = 200
var enable = true

func _process(delta):
	if enable:
		$Timer.start()
		enable = false

func _on_timer_timeout():
	timeScore -= 1
	update_time()
	if timeScore == 0:
		get_tree().reload_current_scene()
	enable = true

func update_time():
	$TimeCounter.text = str(timeScore)
