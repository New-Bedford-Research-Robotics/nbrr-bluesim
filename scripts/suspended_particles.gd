extends Spatial




var vehicle



func _ready():
	var vehicles = get_tree().get_nodes_in_group("vehicles")
	if len(vehicles) == 0:
		print("unable to find a vehicle to follow!")
		return
	self.vehicle = vehicles[0]



func _process(_delta):
	if not self.vehicle:
		return
	global_transform.origin = vehicle.global_transform.origin
	global_transform.basis = vehicle.global_transform.basis
