extends KinematicBody2D

var speed = 600
var velocity = Vector2()
var damage = 1
var score = 0

onready var popupWindow = get_node("EndGameWindow")
onready var ball = get_node(".")

signal scoreAdd


func _ready():
	start()


func start():
	velocity = Vector2(speed, 0).rotated(rand_range(0,360))


func _physics_process(delta):
	check()
	var collision = move_and_collide(velocity * delta)
	if collision:
		score_add()
		velocity = velocity.bounce(collision.normal)
		velocity.y += randi() % 21
		if collision.collider.is_in_group("Brick"):
			if collision.collider.has_method("hit"):
				collision.collider.hit(damage)
		if collision.collider.is_in_group("floor"):
			alert(popupWindow, "You lose, NOOB!!!", "Game Over")


func check():
	if get_tree().get_nodes_in_group("Brick").size() == 0:
		alert(popupWindow, "You Win!", "Victory!")


func alert(popupWindow, text: String, title: String='Message'):
	var labelNote = get_node("EndGameWindow/Buttons/NoteLabel")
	popupWindow.window_title = title
	labelNote.text = text
	popupWindow.visible = true
	get_tree().paused = true
	
	
func score_add():
	var labelScore = get_tree().get_root().get_node("Node2D/ScoreInterface/ScoreLabel")
	score += 1
	labelScore.text = "Score: " + score as String


func _on_RestartButton_pressed():
	popupWindow.visible = false
	get_tree().paused = false
	get_tree().change_scene("res://game.tscn")


func _on_QuitButton_pressed():
	popupWindow.visible = false
	get_tree().paused = false
	get_tree().change_scene("res://mainMenu.tscn")
