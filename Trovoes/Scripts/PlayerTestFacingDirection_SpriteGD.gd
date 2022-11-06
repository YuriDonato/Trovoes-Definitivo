extends Sprite

export var bounce_speed := 8.0

const SPRITES_MAP :={
	Vector2.LEFT: preload("C:/Users/User/Documents/GitHub/Trovoes-Definitivo/Trovoes/Assets/Sprite/PlayerTest/testildo_left.png"),
	Vector2.DOWN:  preload("C:/Users/User/Documents/GitHub/Trovoes-Definitivo/Trovoes/Assets/Sprite/PlayerTest/testildo_down.png"),
	Vector2.RIGHT:  preload("C:/Users/User/Documents/GitHub/Trovoes-Definitivo/Trovoes/Assets/Sprite/PlayerTest/testildo_left.png"),
	Vector2.UP:  preload("C:/Users/User/Documents/GitHub/Trovoes-Definitivo/Trovoes/Assets/Sprite/PlayerTest/testildo_up.png"),
	Vector2(1.0,1.0): preload("C:/Users/User/Documents/GitHub/Trovoes-Definitivo/Trovoes/Assets/Sprite/PlayerTest/testildo_down.png"),
	Vector2(1.0,-1.0): preload("C:/Users/User/Documents/GitHub/Trovoes-Definitivo/Trovoes/Assets/Sprite/PlayerTest/testildo_up.png"),
	Vector2(-1.0,-1.0): preload("C:/Users/User/Documents/GitHub/Trovoes-Definitivo/Trovoes/Assets/Sprite/PlayerTest/testildo_up.png"),
	Vector2(-1.0,1.0): preload("C:/Users/User/Documents/GitHub/Trovoes-Definitivo/Trovoes/Assets/Sprite/PlayerTest/testildo_down.png"),
}

var look_direction := Vector2.RIGHT

func _process(_delta: float) -> void:
	var input_vector := Vector2(
		float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")),
		float(Input.is_action_pressed("ui_down")) - float(Input.is_action_pressed("ui_up"))
	)

	if input_vector.length() > 0.0 and input_vector != look_direction:
		texture = SPRITES_MAP[input_vector]
		look_direction = input_vector
		flip_h = sign(look_direction.x) == 1.0
	position.y = sin(OS.get_ticks_msec() / 200.0) * bounce_speed
