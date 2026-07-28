extends AnimationPlayer

onready var anim_player = $AnimationPlayer

func _ready():
	# Plays the animation named "Idle"
	anim_player.play("Swimming") 
