extends CharacterBody2D

var SPEED = 300.0
const JUMP_VELOCITY = -2100
const GRAVITY = 98.0

@onready var anim = $AnimatedSprite2D
@onready var timer = $Timer

var attacking = false  # Variable para rastrear si el personaje está atacando
var move : bool = false  # Varible para determinar si el personaje se esta moviendo

func _ready():
	pass

# De aca 
func _process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY
		SPEED = 670
	else:
		SPEED = 300
		velocity.y = 0
# Hasta acá sabes lo que hace (define las propiedades del salto)

	# Manejar el ataque
	if Input.is_action_just_pressed("atack") and not attacking:
		anim.play("atack")  # Aca tenia un ("attack", false) para que no se repdoduzca en bucle pero lo arregle en el nodo (y a mi me lo rompe)
		attacking = true  # Establece el estado de ataque como verdadero

	if not attacking:

		anim.play("quiet")

	# Manejar el salto
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Manejar el movimiento horizontal
		var direction = Input.get_axis("ui_left", "ui_right")
		if Input.is_action_pressed("ui_focus_prev") and direction > 0:
			SPEED = 600

		if direction != 0:
			velocity.x = direction * SPEED

			if direction < 0:
				anim.play("walk(atras)")
			else:
				anim.play("walk(adelante)")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			anim.play("quiet")

	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	attacking = false

func _on_timer_timeout():

	attacking = false
	print("atack false")

	timer.stop()
