extends AnimatedSprite



var trigger_transparency = false
var is_transparent = false

export var transparancy_time = 1.4
var transparancy_delay = 0.05
var elapsedtime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if trigger_transparency and not is_transparent:
		is_transparent = true
		trigger_transparency = false
		
	if is_transparent:
		enable_transparancy(delta) 

func enable_transparancy(delta):
	if elapsedtime < transparancy_time:
		self.material.set("shader_param/transparent", true)

		if elapsedtime < transparancy_delay:
			self.material.set("shader_param/transparent", false)
		elapsedtime += delta
	else:
		self.material.set("shader_param/transparent", false)
		is_transparent = false
		elapsedtime = 0



func _on_ninja_anim_animation_finished():
	if self.animation == "cast":
		self.play("dance")
