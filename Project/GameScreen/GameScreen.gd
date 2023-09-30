extends Control

@export var memoryTile: PackedScene
@onready var scorer = $Scorer

@onready var sound = $Sound
@onready var gridContainer = $BoxContainer/GridMargin/GridContainer

func _ready():
	SignalManager.levelSelected.connect(LevelSelected)

func _process(delta):
	if Input.is_key_pressed(KEY_Y):
		pass

func AddMemoryTile(imageDict: Dictionary, frameImage: CompressedTexture2D):
	var newTile = memoryTile.instantiate()
	gridContainer.add_child(newTile)
	newTile.SetUp(imageDict,frameImage)

func LevelSelected(level: int):
	var levelSelection = GameManager.GetLevelSelection(level)
	var frameImage = ImageManager.GetRandomFrame()
	
	gridContainer.columns = levelSelection.Cols
	
	for imageDict in levelSelection.List:
		AddMemoryTile(imageDict, frameImage)
	scorer.NewGame(levelSelection.Pairs)

func ExitButtonPressed():
	SoundManager.ClickSound(sound)
	SignalManager.exitButtonPressed.emit()
