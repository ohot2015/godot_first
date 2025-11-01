extends RigidBody2D


@export var speedEnime = 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_parent()
	print(screen_size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$AnimatedSprite2D.play()
	var velocity = Vector2.ZERO
	position += velocity * delta * speedEnime
	print("velosity", velocity)	
	#print(screen_size)
	#position = position.clamp(Vector2.ZERO, screen_size)
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	pass # Replace with function body.
