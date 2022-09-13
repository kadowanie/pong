extends KinematicBody2D

var speed = 300
var velocity = Vector2()
func _ready():
	start()
	
func start():
	velocity = Vector2(speed, 0).rotated(rand_range(0,360))

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.is_in_group("Brick"):
			collision.collider.queue_free()
			if get_tree().get_nodes_in_group("Brick").size()==1:
				alert("you win!", "Victory!")
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
		#if collision.collider.has_method("hit"):
			#collision.collider.hit()
