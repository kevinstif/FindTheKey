extends CanvasLayer

@onready var joystick = $Joystick
signal sendJoystick(j:Joystick)

func _ready():
	sendJoystick.emit(joystick)
