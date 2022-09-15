extends StaticBody2D

class_name Brick
# Declare member variables here. Examples:
var life =1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func hit(damage):
	bonus()
	life=life-damage
	if life == 0:
		self.queue_free()

func bonus():
	pass
