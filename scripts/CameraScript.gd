extends Camera2D

var camera_speed = 5000.0  # Adjust this value for the desired camera speed
var acceleration = 15.0    # Adjust this value for the desired acceleration
var velocity = Vector2(0, 0)


func _process(delta):
	var input_vector = Vector2(0, 0)

	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1

	input_vector = input_vector.normalized()

	# Apply acceleration to the velocity
	velocity += input_vector * acceleration 

	# Limit the velocity to the camera_speed
	if velocity.length() > camera_speed:
		velocity = velocity.normalized() * camera_speed

	# Update the camera's position
	position += velocity * delta

	# Apply deceleration (friction) to gradually slow down the camera
	velocity -= velocity * delta  # You can adjust the deceleration factor here
	
	if Input.is_action_just_pressed("zoom_in"):
		zoom = Vector2(zoom.x + 1, zoom.y + 1);
	if Input.is_action_just_pressed("zoom_out"):
		zoom = Vector2(zoom.x - 1, zoom.y - 1);

