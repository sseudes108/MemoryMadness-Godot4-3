extends TextureButton

@onready var label = $Label
@onready var sound = $Sound

var lvlNumber: float = 0

func _ready():
	pass

func SetLevelNumber(level: int) -> void:
	lvlNumber = level
	var lvlData = GameManager.LEVELS[level]
	label.text = "%sx%s" % [lvlData.rows,lvlData.cols]

func Pressed():
	SoundManager.ClickSound(sound)
	SignalManager.levelSelected.emit(lvlNumber)
