tool 
extends VisualShaderNodeCustom
class_name VisualShaderNodeDither

func _get_name():
	return "Dither"

func _get_category():
	return "3D"

func _get_subcategory():
	return "Dither"

func _get_description():
	return "Dither"

func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_SCALAR

func _get_input_port_count():
	return 1

func _get_input_port_name(port):
	match port:
		0:
			return "value"

func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_SCALAR

func _get_output_port_count():
	return 1
	
func _get_output_port_name(port):
	match port:
		0:
			return "alpha scissor"
			
func _get_output_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_SCALAR

func _get_global_code(mode):
	if mode != Shader.MODE_SPATIAL:
		return ""
		
	var code = preload("dither.shader").code
	code = code.replace("shader_type spatial;\n", "")
	return code



func _get_code(input_vars, output_vars, mode, type):
	if mode != Shader.MODE_SPATIAL or type != VisualShader.TYPE_FRAGMENT:
		return ""
	
	
	var value = "1.0"
	
	if input_vars[0]:
		value = input_vars[0]
	
	var params = [value, output_vars[0]]
	
	
	
	return "dither(FRAGCOORD, %s, %s);" % params

func _init():
	
	
	if not get_input_port_default_value(0):
		set_input_port_default_value(0, 1.0)
