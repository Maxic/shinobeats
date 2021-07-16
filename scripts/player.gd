extends KinematicBody2D


var dead = false
var current_wall = null
var current_wall_node = null
enum FLOOR{
  ground,
  first
}


#const FLOOR_HEIGHT = 210
var on_floor = FLOOR.ground
var pattern = "default"
var pattern1 = preload("res://assets/blue_cubes.jpg")
var pattern2 = preload("res://assets/orange_waves.jpg")
var stamp = preload("res://game_objects/shinobi_stamp.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("pattern1"):
		$ninja_anim.material.set("shader_param/transparent", true)
		pattern = "pattern1"
		if current_wall == pattern:
			stamp(current_wall_node)
			get_node("/root/main/shake_cam").trigger_shake = true
		
	if Input.is_action_just_pressed("pattern2"):
		$ninja_anim.material.set("shader_param/transparent", true)
		pattern = "pattern2"
		if current_wall == pattern:
			stamp(current_wall_node)
			get_node("/root/main/shake_cam").trigger_shake = true
		
	if pattern == "pattern1" && Input.is_action_just_released("pattern1"):
		$ninja_anim.material.set("shader_param/transparent", false)
		pattern = "default"
		current_wall = null
		
	if pattern == "pattern2" && Input.is_action_just_released("pattern2"):
		$ninja_anim.material.set("shader_param/transparent", false)
		pattern = "default"
		
	if dead:
		pass

func stamp(node):
	var stamp_instance = stamp.instance()
	node.add_child(stamp_instance)
	stamp_instance.get_child(0).play("stamp")

		# TODO: $shader_pattern.material.set("shader_param/dead", true)
	
	# Not using switch mechanic currently
#	if Input.is_action_just_pressed("switch"):
#		if on_floor ==  FLOOR.ground:
#			position.y -= FLOOR_HEIGHT
#			on_floor = FLOOR.first
#		else:
#			position.y += FLOOR_HEIGHT;
#			on_floor = FLOOR.ground
