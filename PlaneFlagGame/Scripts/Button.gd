extends Button

func _ready():
	pressed.connect(_on_Start_pressed)

func _on_Start_pressed():
	OS.shell_open("https://github.com/FogMoe/Godot-Demos")

