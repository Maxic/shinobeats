extends KinematicBody2D


enum FLOOR{
  ground,
  first
}

const FLOOR_HEIGHT = 200

# Declare member variables here. Examples:
var on_floor = FLOOR.ground


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("switch"):
		if on_floor ==  FLOOR.ground:
			position.y += FLOOR_HEIGHT
			on_floor = FLOOR.first
		else:
			position.y -= FLOOR_HEIGHT;
			on_floor = FLOOR.ground
