extends Node
class_name Scorer

@onready var sound = $Sound
@onready var timer = $Timer

#var tiles: Array = []
var selections: Array = []
var pairs: int = 0
var movesMade: int = 0
var pairsMade: int = 0

func _ready():
	SignalManager.tileSelected.connect(TileSelected)
	SignalManager.exitButtonPressed.connect(Exit)

func NewGame(targetPairs: int):
	selections.clear()
	movesMade = 0
	pairsMade = 0
	pairs = targetPairs
#	tiles = get_tree().get_nodes_in_group(GameManager.GROUP_TILE)

#4.5
func SucessPair():
	for tile in selections:
		tile.SucessPair()
	pairsMade += 1
	SoundManager.PlaySound(sound, SoundManager.SOUND_SUCCESS)

#4
func SelectionsPaired() -> bool:
	if selections.size() == 2:
		return selections[0].GetItemName() == selections[1].GetItemName()
	else:
		return false

#3
func UpdateSelections():
	timer.start()
	if SelectionsPaired() == true:
		SucessPair()

#2
func CheckPair(tile: MemoryTile):
	tile.Reveal(true)
	selections.append(tile)
	if selections.size() != 2:
		return
	else:
		SignalManager.selectionDisabled.emit()
		movesMade += 1
		UpdateSelections()

#1
func TileSelected(tile: MemoryTile):
	SoundManager.ClickSound(sound)
	CheckPair(tile)

func HideSelections():
	for item in selections:
		item.Reveal(false)

func OnTimeout():
	if selections.size() != 2:
		HideSelections()
		selections.clear()
	
	if SelectionsPaired() == false:
		HideSelections()
	selections.clear()
	SignalManager.selectionEnabled.emit()

func Exit():
	timer.stop()
