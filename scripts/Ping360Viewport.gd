extends ViewportContainer




var sonar = null
var img = Image.new()
var last_points = []
var angle = 0



func on_ping360_update(pingAngle, points):
	self.last_points = points
	self.angle = pingAngle



func _ready():
	var sonars = get_tree().get_nodes_in_group("ping360")
	if len(sonars) == 0:
		print("unable to find ping360")
		return
	self.sonar = sonars[0]
	self.sonar.connect("updatePing360Display", self, "on_ping360_update")

	
	var array_width = 100
	var array_heigh = 360
	var array = []
	for _y in range(360):
		for _x in range(100):
			array.append(0)

	
	var byte_array = PoolByteArray(array)

	
	
	img.create_from_data(array_width, array_heigh, false, Image.FORMAT_R8, byte_array)


func _process(_delta):
	visible = Globals.ping360_enabled
	img.lock()
	for x in range(100):
		img.set_pixel(x, angle, 0)
	for point in last_points:
		var distance = point[0]
		var intensity = point[1]
		img.set_pixel(int(distance), angle, Color(intensity, intensity, intensity))

	img.unlock()
	
	
	
	var texture = ImageTexture.new()
	texture.create_from_image(img, 0)
	
	self.get_material().set_shader_param("my_array", texture)


func _on_Ping360Toggle_toggled(button_pressed):
	Globals.ping360_enabled = button_pressed
