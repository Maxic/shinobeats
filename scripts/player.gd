extends KinematicBody2D


enum FLOOR{
  ground,
  first
}

const FLOOR_HEIGHT = 210

# Declare member variables here. Examples:
var on_floor = FLOOR.ground
var pattern1 = preload("res://assets/blue_cubes.jpg")
var pattern2 = preload("res://assets/orange_waves.jpg")

signal pattern_switch

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("switch"):
		if on_floor ==  FLOOR.ground:
			position.y += FLOOR_HEIGHT
			on_floor = FLOOR.first
		else:
			position.y -= FLOOR_HEIGHT;
			on_floor = FLOOR.ground
	
	if Input.is_action_just_pressed("pattern1"):
		$shader_pattern.material.set("shader_param/mask_texture", pattern1)

	if Input.is_action_just_pressed("pattern2"):
		$shader_pattern.material.set("shader_param/mask_texture", pattern2)
