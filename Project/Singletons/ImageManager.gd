extends Node

var itemImagem: Array = []

func _ready():
	LoadImages()

func AddToList(file: String, path: String) -> void:
	var fullPath = path + "/" + file
	
	var imageDict = {
		"ItemName": file.rstrip(".png"),
		"ItemTexture": load(fullPath)
	}
	itemImagem.append(imageDict)

func LoadImages() -> void:
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
