tool
extends EditorScript

func _run():
	# Access the editor interface using Godot 3 syntax
	var ei = get_editor_interface()
	var selection = ei.get_selection()
	var selected_nodes = selection.get_selected_nodes()
	
	if selected_nodes.empty():
		print("Please select the parent node of your collision siblings first.")
		return
		
	# Target the first selected node (usually your root or StaticBody)
	var parent = selected_nodes[0]
	var count = 0
	
	# Loop through sibling nodes
	for child in parent.get_children():
		# Node name in Godot 3 is exactly CollisionShape
		if child is CollisionShape and child.shape:
			# Check if the shape resource exposes a margin property
			if "margin" in child.shape:
				child.shape.margin = 0.001
				count += 1
				
	print("Successfully updated ", count, " convex collision shapes to 0.001 margin!")
