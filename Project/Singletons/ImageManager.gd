extends Node

var itemImagem: Array = []

const FRAMES: Array = [
	preload("res://assets/frames/blue_frame.png"), 
	preload("res://assets/frames/green_frame.png"), 
	preload("res://assets/frames/red_frame.png"), 
	preload("res://assets/frames/yellow_frame.png")
]

func _ready():
	LoadImages()

func AddToList(file: String, path: String):
	var fullPath = path + "/" + file
	
	var imageDict = {
		"ItemName": file.rstrip(".png"),
		"ItemTexture": load(fullPath)
	}
	itemImagem.append(imageDict)

func LoadImages():
	var path = "res://assets/glitch"
	var dir = DirAccess.open(path)
	
	if not dir:
		print("ERROR: ", path)
		return
	
	var fileNames = dir.get_files()
	
	for file in fileNames:
		if ".import" not in file:
			AddToList(file,path)

func SetRandomImage() -> Dictionary:
	return itemImagem.pick_random()

#Image Grid Logic
func GetImage(index: int) -> Dictionary:
	return itemImagem[index]

func GetRandomFrame() -> CompressedTexture2D:
	return FRAMES.pick_random()

func ShuffleImages():
	itemImagem.shuffle()

	
	
	
	
	
	
	
	
	
	
	
	
	
