extends CanvasLayer

@onready var mainScene = $MainScene
@onready var gameScreen = $GameScreen
@onready var sound = $Sound

func _ready():
	ExitButtonPressed()
	SignalManager.exitButtonPressed.connect(ExitButtonPressed)
	SignalManager.levelSelected.connect(LevelSelected)

func PlayGame(play: bool):
#	mainScene.visible = play
#	gameScreen.visible = !play
	if play == true:
		mainScene.hide()
		gameScreen.show()
	else:
		gameScreen.hide()
		mainScene.show()

func ExitButtonPressed():
	PlayGame(false)
	SoundManager.PlaySound(sound, SoundManager.SOUND_MAIN_MENU)

func LevelSelected(level: int):
	PlayGame(true)
	SoundManager.PlaySound(sound, SoundManager.SOUND_IN_GAME)
