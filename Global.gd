extends Node

var VP = Vector2.ZERO
var score = 0
var lives = 5


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	#VP = get_viewport().size
	VP = Vector2(1925,930)
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
	reset()
	
func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var Pause_Menu = get_node_or_null("/root/Game/UI/Pause_Menu")
		if Pause_Menu == null:
			get_tree().quit()
		else:
			if Pause_Menu.visible:
				Pause_Menu.hide()
				get_tree().paused = false
			else:
				Pause_Menu.show()
				get_tree().paused = true
	
func reset():
	score = 0
	lives = 5

#func _unhandled_input(_event):
	#if Input.is_action_pressed("quit"):
		#get_tree().quit()

func _resize():
	#VP = get_viewport().size
	pass


func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/HUD/Score")
	if Score != null:
		Score.text = "Score: " + str(score)

func update_lives(l):
	lives += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var Lives = get_node_or_null("/root/Game/UI/HUD/Lives")
	if Lives != null:
		Lives.text = "Lives: " + str(lives)
