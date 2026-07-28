extends PanelContainer







func _ready():
	if Globals.isHTML5:
		Globals.physics_rate = 60
	else:
		Globals.physics_rate = 200
	Engine.iterations_per_second = Globals.physics_rate
	$VBoxContainer / physicsRate.text = "Physics: " + String(Globals.physics_rate) + " Hz"
	$VBoxContainer / physicsRateSlider.value = Globals.physics_rate







func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if not self.is_visible():
			self.show()
		else:
			self.hide()


func _on_HSlider_value_changed(value):
	Globals.physics_rate = value
	Engine.iterations_per_second = value
	$VBoxContainer / physicsRate.text = "Physics: " + String(Globals.physics_rate) + "Hz"
