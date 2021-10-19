extends KinematicBody2D

export var acel_caida = 400
export var velocity = Vector2 (150.0 , 150.0)
export var fuerza_salto = 3000

var movimiento = Vector2.ZERO

onready var animacion = $AnimatedSprite
onready var audio_salto = $Audiosalto
func _physics_process(delta):
	movimiento.x = velocity.x * tomar_direccion()	

	caer()
	saltar()
	move_and_slide(movimiento, Vector2.UP)


func tomar_direccion():
	var direccion = Input.get_action_strength("move_derecha") - Input.get_action_strength("move_izquierda")
	if direccion == 0:
		animacion.play("idle")
	else :
		if direccion < 0 :
			animacion.flip_h = true
		else :
			animacion.flip_h = false
		animacion.play("correr")
	
	return direccion

func caer():
	if not is_on_floor():
		animacion.play("saltar")
		
		movimiento.y += acel_caida
		movimiento.y = clamp(movimiento.y, -fuerza_salto , velocity.y)
pass

func saltar():
	if Input.is_action_just_pressed("salto") and is_on_floor():
		animacion.play("saltar")
		audio_salto.play()
		movimiento.y = 0
		movimiento.y -= fuerza_salto
		
pass
