extends KinematicBody2D

export (int) var speed = 400
var vel = Vector2()

#func _ready():
#	#OS.set_window_size(Vector2(320, 240))
#	print(OS.window_size)

func get_input():
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		# CM:: play the animation
		$ap_ast.play("run")
	else:
		$ap_ast.stop()
	vel = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	print(vel)
	move_and_collide(vel * delta)
