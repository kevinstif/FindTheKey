extends Control

@onready var scoreCounter = $ScoreCounter
var score = 0

func update(m:int):
	score = m
	if score < 1000:
		scoreCounter.text = '0' + str(score)
	else:
		scoreCounter.text = str(score)

func increment():
	score += 100
	if score < 1000:
		scoreCounter.text = '0' + str(score)
	else:
		scoreCounter.text = str(score)

