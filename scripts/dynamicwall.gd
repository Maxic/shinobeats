extends Area2D


# Declare member variables here. Examples:
var stamp = preload("res://game_objects/shinobi_stamp.tscn")
var end_scene = preload("res://game_objects/dead_scene_transition.tscn")

export var MOVE_SPEED = 20.0
var delta_sum = 0
const DUSK_BEATS_TTP = 0.00520
var time_per_pixel
var time_per_pixel_threshold

# Called when the node enters the scene tree for the first time.
func _ready():
	time_per_pixel = DUSK_BEATS_TTP
	time_per_pixel_threshold = time_per_pixel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (PlayerState.dead or PlayerState.win):
		delta_sum += delta
		
		if delta_sum >= time_per_pixel_threshold:
			position.x -= 1
			time_per_pixel_threshold += time_per_pixel
		
		if position.x < -257:
			queue_free()	

func _on_dynamicwall_pattern1_body_entered(body):
	var current_pattern = "pattern1"
	body.current_wall = current_pattern
	body.current_wall_node = self
		
func _on_dynamicwall_pattern1_body_exited(body):
	PlayerState.amount_of_panels += 1
	pass

func _on_dynamicwall_pattern2_body_entered(body):
	
	var current_pattern = "pattern2"
	body.current_wall = current_pattern
	body.current_wall_node = self

func _on_dynamicwall_pattern2_body_exited(body):
	PlayerState.amount_of_panels += 1
	pass

func _on_win_panel_body_entered(body):
	PlayerState.win = true
	get_node("/root/main").add_child(end_scene.instance())

func _on_death_zone_1_body_entered(body):
	if body.pattern != 'pattern1':
		body.dead = true


func _on_death_zone_2_body_entered(body):
	if body.pattern != 'pattern2':
		body.dead = true
