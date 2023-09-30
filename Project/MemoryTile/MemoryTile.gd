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

func SucessPair():
	z_index = 1
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(self,"disabled",true,0)
	tween.tween_property(self,"rotation", deg_to_rad(720), 0.5)
	tween.tween_property(self,"scale", Vector2(1.5,1.5), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.6)
	tween.tween_property(self,"scale", Vector2(0,0), 0)

func SelectionEnabled():
	canSelect = true

func SelectionDisabled():
	canSelect = false

func Pressed():
	if canSelect == true:
		SignalManager.tileSelected.emit(self)
		SelectionDisabled()
