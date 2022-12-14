extends Node

onready var pauseDialog = get_node("PauseDialog")

signal pressed

func _ready():
	var rand = RandomNumberGenerator.new()
	var ballScene = load("res://ball.tscn")
	var screen_size = get_viewport().get_visible_rect().size
	for i in range(0, 1):
		var enemy = ballScene.instance()
		rand.randomize()
		var x = rand.randf_range(0, screen_size.x)
		rand.randomize()
		var y = rand.randf_range(0, screen_size.y - 50)
		enemy.position.y = y
		enemy.position.x = x
		add_child(enemy)
	var platformScene = load("res://platform.tscn")
	var platform = platformScene.instance()
	platform.position.y = screen_size.y - 50
	platform.position.x = screen_size.x / 2
	add_child(platform)


func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		pauseDialog.visible = true
		get_tree().paused = true


func _on_Continue_pressed():
	pauseDialog.visible = false
	get_tree().paused = false
