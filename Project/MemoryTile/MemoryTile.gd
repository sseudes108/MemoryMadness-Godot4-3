extends TextureButton

@onready var frame = $Frame
@onready var image = $Image

var itemName: String

func _ready():
	pass 
	

func GetItemName() -> String:
	return itemName

func SetUp(imageDict: Dictionary, frameImage: CompressedTexture2D):
	frame.texture = frameImage
	image.texture = imageDict.ItemTexture
	itemName = imageDict.ItemName
