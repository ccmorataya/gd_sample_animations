extends Area2D

export (int) var speed = 400
const radian = 10

func _ready():
	OS.set_window_size(Vector2(320, 240))
	print(OS.window_size)

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		rotate(radian)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		rotate(-radian)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		# CM:: play the animation
		$AnimationPlayer.play("run")
	else:
		$AnimationPlayer.stop()
	position += velocity * delta
	print(get_position())
