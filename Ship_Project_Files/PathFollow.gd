extends PathFollow


# Adjust this variable to change how fast the object moves
export var speed: float = 1.0

func _process(delta: float) -> void:
	# Increase the distance traversed along the path based on speed and time passed
	self.offset += speed * delta
