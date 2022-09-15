extends KinematicBody2D

var speed = 600
var velocity = Vector2()
var damage = 1
func _ready():
	start()
	
func start():
	velocity = Vector2(speed, 0).rotated(rand_range(0,360))

func _physics_process(delta):
	check()
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.is_in_group("Brick"):
			if collision.collider.has_method("hit"):
				collision.collider.hit(damage)
			
		if collision.collider.is_in_group("floor"):
			alert("you lose", "game over")


func alert(text: String, title: String='Message'):
	var dialog = AcceptDialog.new()
	dialog.dialog_text = text
	dialog.window_title = title
	dialog.connect('modal_closed', dialog, 'queue_free')
	add_child(dialog)
	dialog.popup_centered()
	get_tree().paused = true


func check():
	if get_tree().get_nodes_in_group("Brick").size()==0:
		alert("you win!", "Victory!")
