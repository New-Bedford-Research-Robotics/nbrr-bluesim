extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var gainlabel = $BottomHUDContainer/GainLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	gainlabel.text = "Gain: 50"


func update_gain(gain: int) -> void:
	gainlabel.text = "Gain: " + str(gain) 
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
