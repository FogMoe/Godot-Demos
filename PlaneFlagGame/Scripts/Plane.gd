extends Node2D

var velocity = Vector2()
var map_size = Vector2(720, 720)


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(1, 0)  # Plane will move to the right at the start
	$Timer.timeout.connect(_on_Timer_timeout)

func _on_Timer_timeout():
	position += velocity * 80  # Move 80 pixels
	check_bounds()

# Called when there is an input event.
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_UP:
			velocity = Vector2(0, -1)  # Move up
			rotation = deg_to_rad(-90)  # Rotate to face up
		elif event.keycode == KEY_DOWN:
			velocity = Vector2(0, 1)  # Move down
			rotation = deg_to_rad(90)  # Rotate to face down
		elif event.keycode == KEY_LEFT:
			velocity = Vector2(-1, 0)  # Move left
			rotation = deg_to_rad(180)  # Rotate to face left
		elif event.keycode == KEY_RIGHT:
			velocity = Vector2(1, 0)  # Move right
			rotation = deg_to_rad(0)  # Rotate to face right

func check_bounds():
	if position.x < 0 or position.x > map_size.x or position.y < 0 or position.y > map_size.y:
		game_over()

func game_over():
	Settings.isFirstGame =false
	var main_game = get_node("/root/MainGame")
	var score_num = main_game.get_node("Score/ScoreNum")
	Settings.lastScoreNum = score_num.text


	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
	
	# Add your game over logic here
