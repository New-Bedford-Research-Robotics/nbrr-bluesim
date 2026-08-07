extends Node
#these allow communication between BlueROV2Heavy and the HUD
signal gain_changed(new_gain)
signal lights_changed(new_lights)
signal camera_changed(new_camera)
signal depth_changed(new_depth)
signal deadzone_changed(new_deadzone)
signal update_fog(new_fog)
signal update_light(new_light)
