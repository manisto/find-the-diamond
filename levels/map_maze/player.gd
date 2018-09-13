extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var dr = 1.5;
var camera;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	camera = $Camera;

func _physics_process(delta):
	var dir = Vector3();
	var cam_xform = camera.get_global_transform();
	
	if (Input.is_action_pressed("ui_left")):
		rotate_y(dr * delta);
		
	if (Input.is_action_pressed("ui_right")):
		rotate_y(-dr * delta);
	
	if (Input.is_action_pressed("ui_up")):
		dir += -cam_xform.basis.z.normalized();
	
	dir.y = 0;
	dir = dir.normalized();
	move_and_slide(dir * 6);