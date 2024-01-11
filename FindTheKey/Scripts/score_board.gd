extends Control

@onready var moneyScore = $MoneyScore

func update_money(moneys:int):
	moneyScore.update(moneys)
