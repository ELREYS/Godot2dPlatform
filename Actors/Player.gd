extends KinematicBody2D

var run_speed = 225
var jump_force = -665
var gravity = 30
var can_double_jump = true

var velocity = Vector2(0,0)

func request_ready():
	pass

func get_input(delta):
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')
	
	
	if jump and is_on_floor():
		velocity.y = jump_force
		$AnimationPlayer.play("jump")
		#print("Jump1")
		can_double_jump = true
	if  jump and !is_on_floor() and can_double_jump:
		#print("Jump2")
		velocity.y = jump_force
		$AnimationPlayer.play("jump")
		can_double_jump = false

	if right:
		velocity.x += run_speed
		$Sprite.flip_h = false
		#print("WalkRight")
		$AnimationPlayer.play("walk")		
	if left:
		$Sprite.flip_h = true
		#print("WalkLeft")
		$AnimationPlayer.play("walk")
		velocity.x -= run_speed
	elif is_on_floor() and velocity.x == 0:
		$AnimationPlayer.play("idle")
		#print("idle")
		#$AnimationPlayer.play("idle")
	
	
		
	velocity.y += gravity 
	var snap = Vector2.DOWN * 16
	
	




func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
	#var snap = Vector2.DOWN * 16
	#velocity = move_and_slide_with_snap(velocity,snap, Vector2.UP) 
	#velocity.x = lerp(velocity.x,0,0.2)
