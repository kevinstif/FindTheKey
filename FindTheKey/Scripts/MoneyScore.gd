extends Control

@onready var score = $MoneyCounter

func update(moneys:int):
	if moneys < 10:
		score.text = '0' + str(moneys)
	else:
		score.text = str(moneys)
