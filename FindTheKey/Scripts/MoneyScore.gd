extends Control

@onready var score = $MoneyCounter
var moneys = 0

func update(m:int):
	moneys = m
	if moneys < 10:
		score.text = '0' + str(moneys)
	else:
		score.text = str(moneys)

func increment():
	moneys += 1
	if moneys < 10:
		score.text = '0' + str(moneys)
	else:
		score.text = str(moneys)
