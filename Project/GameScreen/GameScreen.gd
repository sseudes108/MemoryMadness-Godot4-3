extends Control

@onready var sound = $Sound

func _ready():
	pass

func _process(delta):
	pass


func ExitButtonPressed():
	SoundManager.ClickSound(sound)
	SignalManager.exitButtonPressed.emit()
