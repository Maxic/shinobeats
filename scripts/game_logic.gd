extends Node2D


# Declare member variables here. Examples:
const WALL_WIDTH = 256

var dynamicwall_pattern1 = preload("res://game_objects/dynamicwall_pattern1.tscn")
var dynamicwall_pattern2 = preload("res://game_objects/dynamicwall_pattern2.tscn")
var static_wall = preload("res://game_objects/static_wall.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var blue_wall_arr = [8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80]
	var yellow_wall_arr = [10,11,14,15,22,23,26,27,30,31,34,35,46,47,50,51,54,55,58,59,62,63,66,67,70,71,74,75,78,79]
	for wall_index in blue_wall_arr:
		spawn_dynamic_wall(dynamicwall_pattern1, (wall_index-1)*WALL_WIDTH)
	for wall_index in yellow_wall_arr:
		spawn_dynamic_wall(dynamicwall_pattern2, (wall_index-1)*WALL_WIDTH)
	
	spawn_static_wall()


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
		
func spawn_static_wall():
	var staticwall_instance = static_wall.instance()
	staticwall_instance.position.x = 1024
	self.add_child(staticwall_instance)
	move_child(staticwall_instance, 0)
		
func spawn_dynamic_wall(object, x_pos):
	var dynamicwall_instance = object.instance()
	dynamicwall_instance.position.x = x_pos
	self.add_child(dynamicwall_instance)
