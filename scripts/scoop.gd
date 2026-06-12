extends TextureRect
class_name Scoop

@export var start_pumping: bool = false


func _ready() -> void:
	if start_pumping: pump_scale()


# animacao pop

func pump_scale():
	scale = Vector2.ZERO
	
	var pump_tween = create_tween()
	pump_tween.set_trans(Tween.TRANS_BACK)
	pump_tween.set_ease(Tween.EASE_OUT)
	
	pump_tween.tween_property(
		self,
		"scale",
		Vector2(1, 1),
		0.5
	)

func pump_scale_back():
	scale = Vector2(1, 1)
	
	var pump_tween = create_tween()
	pump_tween.set_trans(Tween.TRANS_SINE)
	pump_tween.set_ease(Tween.EASE_IN)
	
	pump_tween.tween_property(
		self,
		"scale",
		Vector2.ZERO,
		0.2
	)
	pump_tween.finished.connect(func(): queue_free())
