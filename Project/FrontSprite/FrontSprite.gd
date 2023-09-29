extends TextureRect

const SPIN_TIME: Vector2 = Vector2 (1,2)
const SCALE_NORMAL: Vector2 = Vector2 (1,1)
const SCALE_SMALL: Vector2 = Vector2 (0.1,0.1)
const SCALE_SPEED: float = 0.5

func _ready():
	Spin()

func SetTexture():
	texture = ImageManager.SetRandomImage().ItemTexture

func RandomSpinTime() -> float:
	return randf_range(SPIN_TIME.x, SPIN_TIME.y)

func RandomRotation() -> float:
	return deg_to_rad(randf_range(-360,360))

func Spin() -> void:
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_callback(SetTexture)
	tween.tween_property(self,"scale",SCALE_NORMAL,SCALE_SPEED)
	tween.tween_property(self,"rotation",RandomRotation(),RandomSpinTime())
	tween.tween_property(self,"rotation",RandomRotation(),RandomSpinTime())
	tween.tween_property(self,"scale",SCALE_SMALL,SCALE_SPEED)
