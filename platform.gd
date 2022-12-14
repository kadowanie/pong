extends KinematicBody2D


# platform values
var maxSpeed = 6
var velocity = Vector2()
var slideForce = 100
var stopForce = 13


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var left = Input.get_action_strength("ui_right")
	var right = Input.get_action_strength("ui_left")

	var slide = slideForce * (left - right)
	if abs(slide) < slideForce * 0.2:
		 # The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, stopForce * delta)
	else:
		velocity.x += slide * delta
		velocity.x = clamp(velocity.x, -maxSpeed, maxSpeed)
		var collision = move_and_collide(velocity)
		if collision:
			velocity = velocity.bounce(collision.normal)
			velocity.y = 0
			#if collision.collider.has_method("hit"):
				#collision.collider.hit()
