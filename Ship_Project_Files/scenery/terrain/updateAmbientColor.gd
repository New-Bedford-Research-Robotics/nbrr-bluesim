extends MeshInstance








func _ready():
	pass



func _process(delta):
	self.get_surface_material(0).set_shader_param("ambient_color", Globals.current_ambient)

