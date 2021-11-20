extends Area2D


func _ready():
	pass


func _on_Pinchos_body_entered(body):
	print("entra:" , body.name)
	if body.name == "Saltarina":
		get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_Pinchos_body_exited(body):
	print("sale:" , body.name)
	pass # Replace with function body.
