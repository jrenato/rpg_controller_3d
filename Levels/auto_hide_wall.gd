extends CSGBox3D

enum LAYER {FOREGROUND, BACKGROUND}

var layer: LAYER = LAYER.FOREGROUND


func _process(delta: float) -> void:
	if GameManager.player.position.x > position.x and layer == LAYER.FOREGROUND:
		set_to_background()
	elif GameManager.player.position.x <= position.x and layer == LAYER.BACKGROUND:
		set_to_foreground()


func set_to_foreground() -> void:
	layer = LAYER.FOREGROUND
	set_layer_mask_value(1, false)
	set_layer_mask_value(2, true)


func set_to_background() -> void:
	layer = LAYER.BACKGROUND
	set_layer_mask_value(1, true)
	set_layer_mask_value(2, false)
