extends TextureButton

@onready var label = $Label
@onready var audio = $Audio

var lvlNumber: float = 0

func _ready():
	pass

func SetLevelNumber(level: int) -> void:
	lvlNumber = level
	var lvlData = GameManager.LEVELS[level]
	label.text = "%sx%s" % [lvlData.rows,lvlData.cols]
