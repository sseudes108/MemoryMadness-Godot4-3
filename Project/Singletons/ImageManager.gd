extends Node

var itemImagem: Array = []

const FRAMES: Array = [
	preload("res://assets/frames/blue_frame.png"), 
	preload("res://assets/frames/green_frame.png"), 
	preload("res://assets/frames/red_frame.png"), 
	preload("res://assets/frames/yellow_frame.png")
]

const IMAGES: Array = [
	preload("res://assets/glitch/admin_widget.png"), 
	preload("res://assets/glitch/bag_moving_box.png"), 
	preload("res://assets/glitch/banana.png"), 
	preload("res://assets/glitch/barnacle_pod.png"), 
	preload("res://assets/glitch/blockmaker.png"), 
	preload("res://assets/glitch/blockmaker_chassis.png"), 
	preload("res://assets/glitch/blockmaker_engine.png"), 
	preload("res://assets/glitch/blockmaker_plates.png"), 
	preload("res://assets/glitch/bunch_of_grapes_hell.png"), 
	preload("res://assets/glitch/cabbage.png"), 
	preload("res://assets/glitch/carrot.png"), 
	preload("res://assets/glitch/cauldron.png"), 
	preload("res://assets/glitch/cocktail_shaker.png"), 
	preload("res://assets/glitch/dice_12sided.png"), 
	preload("res://assets/glitch/fried_egg.png"), 
	preload("res://assets/glitch/fuelmaker_case.png"), 
	preload("res://assets/glitch/furniture_chair.png"), 
	preload("res://assets/glitch/furniture_smallwindow.png"), 
	preload("res://assets/glitch/irrigator_9000.png"), 
	preload("res://assets/glitch/lips.png"), 
	preload("res://assets/glitch/metalmaker.png"), 
	preload("res://assets/glitch/npc_deimaginator.png"), 
	preload("res://assets/glitch/npc_dumbbot_variant_widgetGreen_x1_move_png_1354836794.png.png"), 
	preload("res://assets/glitch/npc_fox_fox_orangeFox_x1_iconic_png_1354839585.png.png"), 
	preload("res://assets/glitch/npc_jabba1.png"), 
	preload("res://assets/glitch/npc_juju_bandit_bandana_red_variant_yellow_x1_iconic_png_1354834188.png.png"), 
	preload("res://assets/glitch/parsnip.png"), 
	preload("res://assets/glitch/party_atm.png"), 
	preload("res://assets/glitch/piggy_feeder.png"), 
	preload("res://assets/glitch/pineapple.png"), 
	preload("res://assets/glitch/pumpkin_carved_2.png"), 
	preload("res://assets/glitch/pumpkin_lit_5.png"), 
	preload("res://assets/glitch/quest_req_icon_hellhole.png"), 
	preload("res://assets/glitch/quest_req_icon_letterblock.png"), 
	preload("res://assets/glitch/quill.png"), 
	preload("res://assets/glitch/rock_beryl_1.png"), 
	preload("res://assets/glitch/rock_metal_2.png"), 
	preload("res://assets/glitch/saucepan.png"), 
	preload("res://assets/glitch/sheep_red_wine.png"), 
	preload("res://assets/glitch/shovel.png"), 
	preload("res://assets/glitch/smelter.png"), 
	preload("res://assets/glitch/smoothie.png"), 
	preload("res://assets/glitch/stoot_barfield_pullstring_doll.png"), 
	preload("res://assets/glitch/super_scraper.png"), 
	preload("res://assets/glitch/trophy_street_creator_earth.png"), 
	preload("res://assets/glitch/watering_can.png"), 
	preload("res://assets/glitch/woodworker_chassis.png"), 
	preload("res://assets/glitch/woodworker_fuser.png"), 
	preload("res://assets/glitch/zucchini.png")
	]

func ToList(index: int):
	var imageDict = {
		"ItemName": str(IMAGES[index]),
		"ItemTexture": IMAGES[index]
	}
	itemImagem.append(imageDict)

func Load():
	for file in IMAGES.size():
		ToList(file)

func _ready():
	Load()

func SetRandomImage() -> Dictionary:
	return itemImagem.pick_random()

#Image Grid Logic
func GetImage(index: int) -> Dictionary:
	return itemImagem[index]

func GetRandomFrame() -> CompressedTexture2D:
	return FRAMES.pick_random()

func ShuffleImages():
	itemImagem.shuffle()
