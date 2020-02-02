extends Control


func _on_Submit_pressed():
	
	var dinosaur_parts = []
	
	for part in $"Dinosaur Parts".get_children():
		dinosaur_parts.append(part.duplicate())
	
	var smallestvector2 = dinosaur_parts[0].position
	
	for part in dinosaur_parts:
		if part.position.x < smallestvector2.x:
			smallestvector2.x = part.position.x
		if part.position.y < smallestvector2.y:
			smallestvector2.y = part.position.y
	
	for part in dinosaur_parts:
		part.position -= smallestvector2
	
	Global.add_dinosaur(Dinosaur.new(dinosaur_parts))
	
	if Global.dinosaurs.size() == 3:
		get_tree().change_scene("res://Scenes/Game Over Screen.tscn")
