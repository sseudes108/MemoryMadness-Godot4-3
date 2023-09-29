extends Control

@export var levelButton: PackedScene
@onready var levelGrid = $VBoxContainer/LevelGrid

func _ready():
	SetUpGrid()

func CreateButton(level: int):
	var newButton = levelButton.instantiate()
	levelGrid.add_child(newButton)
	newButton.SetLevelNumber(level)

func SetUpGrid():
	for level in GameManager.LEVELS:
		CreateButton(level)
