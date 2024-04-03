extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(_on_Start_pressed)
	if Settings.isFirstGame==false:
		text="GameOver\nRestart"

func _on_Start_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainGame.tscn")
