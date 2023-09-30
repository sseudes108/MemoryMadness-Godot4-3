extends Node

const GROUP_TILE: String = "Tile"

const LEVELS: Dictionary = {
	1: { "rows": 2, "cols": 2 },
	2: { "rows": 3, "cols": 4 },
	3: { "rows": 4, "cols": 4 },
	4: { "rows": 4, "cols": 6 },
	5: { "rows": 5, "cols": 6 },
	6: { "rows": 6, "cols": 6 }
}

func GetLevelSelection(level: int) -> Dictionary:
	var levelData = GameManager.LEVELS[level]
	var tiles = levelData.rows * levelData.cols
	var pairs: int = (tiles/2)
	var selectedImages = []
	
	ImageManager.ShuffleImages()
	
	for i in range(pairs):
		selectedImages.append(ImageManager.GetImage(i))
		selectedImages.append(ImageManager.GetImage(i))
		
	selectedImages.shuffle()
	
	return {
		"Pairs": pairs,
		"Cols": levelData.cols,
		"List": selectedImages
	}

func ClearNodesOfGroup(group: String):
	for node in get_tree().get_nodes_in_group(group):
		node.queue_free()

