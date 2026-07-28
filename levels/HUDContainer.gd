extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var gain = $BottomHUDContainer/GainLabel
onready var lights = $BottomHUDContainer/LightLabel
onready var camera = $BottomHUDContainer/CameraLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("gain_changed",self,"_on_BlueRov_gain_changed")
	SignalBus.connect("lights_changed",self,"_on_BlueRov_lights_changed")
	SignalBus.connect("camera_changed",self,"_on_BlueRov_camera_changed")

func _on_BlueRov_gain_changed(new_gain):
	gain.text = "Pilot Gain: " + str(new_gain) + "%"
	
func _on_BlueRov_lights_changed(new_lights):
	lights.text = "Lights: " + str(new_lights) + "%"
	
func _on_BlueRov_camera_changed(new_camera):
	camera.text = "Cam Tilt: " + str(new_camera) + "°"
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
