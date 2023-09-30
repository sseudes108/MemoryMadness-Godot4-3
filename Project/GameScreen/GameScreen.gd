extends Control

@export var memoryTile: PackedScene
@onready var scorer: Scorer = $Scorer

@onready var sound = $Sound
@onready var gridContainer = $BoxContainer/GridMargin/GridContainer

@onready var moveCount = $BoxContainer/LabelsMargin/TextContainer/MoveContainer/MoveCount
@onready var pairCount = $BoxContainer/LabelsMargin/TextContainer/PairContainer/PairCount


func _ready():
	SignalManager.levelSelected.connect(LevelSelected)

func _process(_delta):
	moveCount.text = str(scorer.movesMade)
	pairCount.text = "%s / %s" % [scorer.pairsMade, scorer.pairs]

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
