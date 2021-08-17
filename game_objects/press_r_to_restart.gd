extends Label

func _ready():
	if PlayerState.win:
		text = "You won! \n\n Press 'R' to restart"
