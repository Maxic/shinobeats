extends Sprite

# Declare member variables here. Examples:
var delta_sum = 0
export var beats_per_minute = 90.0
var PANEL_LENGTH_PX = 256.0
const SECONDS_PER_MINUTE = 60.0

var time_per_pixel
var time_per_pixel_threshold

# Magic constant number since our calculations don't seem to add up
const DUSK_BEATS_TTP = 0.00520


# Called when the node enters the scene tree for the first time.
func _ready():
	# This doesn't seem to work, and I don't know why, however, we found the constant for dusk beats
#	var beats_per_second = MOVE_SPEED_BPM / SECONDS_PER_MINUTE
#	var pixel_per_second  = PANEL_LENGTH_PX / beats_per_second
#	time_per_pixel = 1 / pixel_per_second
	
	time_per_pixel = DUSK_BEATS_TTP
	time_per_pixel_threshold = time_per_pixel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !PlayerState.dead:
		delta_sum += delta
		
		if delta_sum >= time_per_pixel_threshold:
			position.x -= 1
			time_per_pixel_threshold += time_per_pixel

		if position.x < -1023:
			get_parent().spawn_static_wall()
			queue_free()
