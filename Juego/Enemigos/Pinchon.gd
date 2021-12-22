extends KinematicBody2D

export var velocidad = 100.0

var gravedad = 100.0
var movimiento = Vector2.ZERO

onready var animacion = $AnimatedSprite
onready var detectorvacio = $RayCast2D
onready var detectorpared= $DetectarPared

func _physics_process(delta):
	caer()
	caminar()
	move_and_slide(movimiento, Vector2.UP)

func caer():
	if not is_on_floor():
		movimiento.y = gravedad	

func caminar():
	if is_on_floor():
		animacion.play("caminar")
		detectar_colision()
		movimiento.x = velocidad	
	pass

func animar ():
	animacion.set_flip_h(!animacion.flip_h)
	pass

func detectar_colision():
	if not detectorvacio.is_colliding() or 	detectorpared.is_colliding():
		velocidad*= -1
		detectorvacio.position.x *= -1
		detectorpared.position.x *= -1
		detectorpared.scale *= -1
		animar()
		pass

func _on_Area2D_body_entered(body):
	print("enter:" , body.name)
	#body.respawn()
