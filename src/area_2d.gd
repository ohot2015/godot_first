extends Area2D

@export var speed: float = 400.0
@export var rocket_scene: PackedScene

signal hit

var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	print(screen_size)

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	# 🚀 стрельба по пробелу
	if Input.is_action_just_pressed("fire"):
		shoot_rocket()

func shoot_rocket():
	var rocket = rocket_scene.instantiate()
	rocket.position = position + Vector2(0, -20)
	get_parent().add_child(rocket)

func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false  # теперь комментарий правильный
