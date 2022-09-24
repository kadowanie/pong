extends Node2D


var self_name
var last_char
var index
var self_pos
func _ready():
	self_name = self.get_name()
	get_self_teleport_index()
func _on_Area2D_body_entered(body):
	if index%2==0:
		body.position=event_bus.teleport_positions[index+1]
	else:
		body.position=event_bus.teleport_positions[index-1]
func get_self_teleport_index():
	if self_name.length()==10:
		event_bus.names.insert(0, self_name)
		self_pos = Vector2(self.position.x-200,self.position.y)
		event_bus.teleport_positions.insert(0, self_pos)
		index=0
	elif self_name.length()>10:
		last_char=self_name[self_name.length()-1]
		self_pos = Vector2(self.position.x+200,self.position.y)
		event_bus.names.insert(last_char, self_name)
		event_bus.teleport_positions.insert(last_char, self_pos)
		index=last_char as int
		
