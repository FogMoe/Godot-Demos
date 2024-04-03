extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(_on_Area2D_area_entered)

func _on_Area2D_area_entered(area):
	if area.name == "Plane":
		queue_free()

		var main_game = get_node("/root/MainGame")
		var score_num = main_game.get_node("Score/ScoreNum")
		var timer = main_game.get_node("Plane/Plane/Timer")
		timer.wait_time =timer.wait_time-0.01
		score_num.text = str(int(score_num.text) + 1)
		main_game.create_target()
