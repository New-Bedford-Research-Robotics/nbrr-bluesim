extends Particles




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
	var parent_position = vehicle.global_transform.origin
	var current_y = global_transform.origin.y
	var new_position = Vector3(parent_position.x, current_y, parent_position.z)
	global_transform.origin = new_position
