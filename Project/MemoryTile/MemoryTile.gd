extends TextureButton
class_name MemoryTile

@onready var frame = $Frame
@onready var image = $Image

var itemName: String
var canSelect: bool = true

func _ready():
	SignalManager.selectionEnabled.connect(SelectionEnabled)
	SignalManager.selectionDisabled.connect(SelectionDisabled)

func GetItemName() -> String:
	return itemName

func Reveal(reveal: bool):
	image.visible = reveal
	frame.visible = reveal

func SetUp(imageDict: Dictionary, frameImage: CompressedTexture2D):
	frame.texture = frameImage
	image.texture = imageDict.ItemTexture
	itemName = imageDict.ItemName

func SelectionEnabled():
	canSelect = true

func SelectionDisabled():
	canSelect = false

func Pressed():
	if canSelect == true:
		SignalManager.tileSelected.emit(self)
