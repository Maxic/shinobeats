extends Label


# Declare member variables here. Examples:
# var a = 2
var delta_sum = 0.0
var step = 0.00522 * 256
var threshold = step


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if delta_sum >= threshold:
		self.text = str(int(self.text) + 1) 
		threshold += step
	
	delta_sum += delta
	
