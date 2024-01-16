extends Control

@onready var moneyScore = $MoneyScore
@onready var score = $Score

func update_money(moneys:int):
	moneyScore.update(moneys)

func increment_money():
	moneyScore.increment()
	increment_score()

func increment_score():
	score.increment()
