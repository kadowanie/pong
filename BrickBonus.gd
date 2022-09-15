extends Brick

#var brick= load("brick.gd")
#var bonusshit = brick.new()

	
# Called when the node enters the scene tree for the first time.
func _ready():

	#bonusshit.life = 3
	life=3
	#var ballNode = get_tree().get_root().find_node("ball",true,false)
	#ballNode.connect("hitted_by_ball",self,"hit")
func bonus():
	if life==3:
		$ColorRect.color = Color(255, 0, 0, 1)
	if life==2:
		$ColorRect.color = Color(0, 255, 0, 1)
	if life==1:
		pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
