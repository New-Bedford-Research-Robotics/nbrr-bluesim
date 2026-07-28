extends MeshInstance

signal updatePing360Display
var last_points = [[0, 0], [0, 0], [0, 0]]
var max_distance = 400
var n_offsets = 40
var max_offset = 0.3
var target_offsets = [
	0.0, 0.01, 0.02, 0.04, 0.07, 0.09, 0.11, 0.13, 0.15, 0.17, 0.18, 0.19, 0.21, 0.22, 0.25, 0.28
]




var angle = 0
var last_angle = angle


var texture = ImageTexture.new()


func _ready():
	
	var new_targets = []
	var increment = 2 * max_offset / n_offsets
	for i in range(int(n_offsets / 2)):
		new_targets.append( - max_offset + i * increment)
		new_targets.append(max_offset - i * increment)
	target_offsets = new_targets
	print(target_offsets)


func _physics_process(_delta):
	if not Globals.ping360_enabled:
		return
	if last_angle == angle:
		return
	var space_state = get_world().direct_space_state
	
	var target_list = []
	
	for offset in target_offsets:
		target_list.append(
			(
				global_transform.origin
				+ self.global_transform.basis.xform(
					Vector3(0, max_distance * offset, max_distance).rotated(
						Vector3(0, 1, 0), deg2rad(angle)
					)
				)
			)
		)
	last_points = []
	for cur_target in target_list:
		var result = space_state.intersect_ray(global_transform.origin, cur_target, [self])
		
		if "position" in result:
			var distance_vector = global_transform.origin - result["position"]
			var distance = distance_vector.length() * 1000 / max_distance
			var intensity = abs(result["normal"].dot(distance_vector.normalized()))
			last_points.append([distance, intensity])
	last_angle = angle


func _process(_delta):
	if not Globals.ping360_enabled:
		return
	emit_signal("updatePing360Display", angle, last_points)
	angle = (angle + 1) % 360




