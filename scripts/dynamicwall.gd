extends Area2D


# Declare member variables here. Examples:
var stamp = preload("res://game_objects/shinobi_stamp.tscn")

export var MOVE_SPEED = 20.0
var delta_sum = 0
const DUSK_BEATS_TTP = 0.00522
var time_per_pixel
var time_per_pixel_threshold

# Called when the node enters the scene tree for the first time.
func _ready():
	time_per_pixel = DUSK_BEATS_TTP
	time_per_pixel_threshold = time_per_pixel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta_sum += delta
	
	if delta_sum >= time_per_pixel_threshold:
		position.x -= 1
		time_per_pixel_threshold += time_per_pixel
	
	if position.x < -257:
		queue_free()
	

func _on_dynamicwall_pattern1_body_entered(body):
	pass
	#validate_state(body.pattern, "pattern1")
		
func _on_dynamicwall_pattern1_body_exited(body):
	validate_state(body.pattern, "pattern1")

func _on_dynamicwall_pattern2_body_entered(body):
	pass
	#validate_state(body.pattern, "pattern2")

func _on_dynamicwall_pattern2_body_exited(body):
	validate_state(body.pattern, "pattern2")

func validate_state(current_state, desired_state):
	if current_state == desired_state:
		var stamp_instance = stamp.instance()
		add_child(stamp_instance)
		#print("good with state: " + current_state)
	else:
		print("dead!")
		get_node("/root/main/player").dead = true
