extends Node

@onready var sound = $Sound
@onready var timer = $Timer

var tiles: Array = []
var selections: Array = []
var pairs: int = 0
var movesMade: int = 0
var pairsMade: int = 0

func _ready():
	SignalManager.tileSelected.connect(TileSelected)

func _process(delta):
	pass

func TileSelected(tile: MemoryTile):
	tile.Reveal(true)
	selections.append(tile)
	pass
