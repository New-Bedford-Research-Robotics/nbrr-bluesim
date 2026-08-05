tool
extends EditorScript

const TARGET_MARGIN = 0.001

func _run():
	var ei = get_editor_interface()
	var selection = ei.get_selection()
	var selected_nodes = selection.get_selected_nodes()

	if selected_nodes.empty():
		print("Please select the root node first.")
		return

	var root = selected_nodes[0]
	var count = _process_node(root)

	print("Successfully updated ", count, " ConvexPolygonShape margins to ", TARGET_MARGIN)


func _process_node(node):
	var count = 0

	# Process this node
	if node is CollisionShape:
		if node.shape and node.shape is ConvexPolygonShape:
			node.shape.margin = TARGET_MARGIN
			count += 1

	# Recursively process all children
	for child in node.get_children():
		count += _process_node(child)

	return count
