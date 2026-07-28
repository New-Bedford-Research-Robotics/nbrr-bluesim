extends InterpolatedCamera







func _ready():
	pass



func _process(_delta):
	if Globals.active_vehicle:
		self.look_at(Globals.active_vehicle.transform.origin, Vector3(0, 1, 0))
