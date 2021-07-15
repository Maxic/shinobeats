extends Camera2D

export var shake_power = 5
export var shake_time = 0.1
var trigger_shake = false
var is_shake = false
var cur_pos
var elapsedtime = 0

func _ready():
	randomize()
	cur_pos = offset

func _process(delta):
	if is_shake:
		shake(delta)    

func _input(event):
	if trigger_shake and not is_shake:
		elapsedtime = 0
		is_shake = true
		trigger_shake = false

func shake(delta):
	if elapsedtime<shake_time:
		offset =  Vector2(randf(), randf()) * shake_power
		elapsedtime += delta
	else:
		is_shake = false
		elapsedtime = 0
		offset = cur_pos   
