extends Area2D

@export var speed: float = 300.0
signal hit_enemy

var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.play("default")  # если у тебя есть анимация

func _process(delta: float) -> void:
	# Двигаемся вверх
	position.y -= speed * delta

	# Если ракета вышла за экран — удаляем
	if position.y < -50:
		queue_free()

# Когда ракета сталкивается с врагом
func _on_body_entered(body: Node2D) -> void:
	emit_signal("hit_enemy", body)
	queue_free()
