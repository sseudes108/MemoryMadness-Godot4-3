extends Control

@onready var sound = $Sound
@onready var movesCount = $"NinePatchRect/MarginContainer/VBoxContainer/HBoxContainer/Moves Count"

func _ready():
	SignalManager.gameOver.connect(GameOver)

func GameOver(moves: int):
	movesCount.text = str(moves)
	show()

func ExitButtonPressed():
	hide()
	SoundManager.ClickSound(sound)
	SignalManager.exitButtonPressed.emit()
