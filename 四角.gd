extends KinematicBody

onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")\
		* ProjectSettings.get_setting("physics/3d/default_gravity_vector")

onready var camera = $"../カメラ"

func _physics_process(delta):
	var velocity: Vector3

	if is_on_floor():
		velocity = Vector3.ZERO
	else:
		velocity = gravity
	
	if Input.is_action_pressed("ui_right"):
		velocity += camera.global_transform.basis.x.normalized() * 2
	if Input.is_action_pressed("ui_left"):
		velocity -= camera.global_transform.basis.x.normalized() * 2
	if Input.is_action_pressed("ui_down"):
		velocity += camera.global_transform.basis.z.normalized() * 2
	if Input.is_action_pressed("ui_up"):
		velocity -= camera.global_transform.basis.z.normalized() * 2

	rotate_y(delta * 1)

	#velocity = move_and_slide_with_snap(velocity, Vector3.DOWN, Vector3.UP, true)
	velocity = move_and_slide(velocity, Vector3.UP, true)
