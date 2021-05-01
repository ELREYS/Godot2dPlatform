extends KinematicBody2D

var run_speed = 350
var jump_speed = -800
var gravity = 30
var can_double_jump = true

var velocity = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	
	if right:
		velocity.x += run_speed
		$Sprite.flip_h = false
		$AnimationPlayer.play("walk")
	if left:
		$Sprite.flip_h = true
		$AnimationPlayer.play("walk")
		velocity.x -= run_speed
	elif is_on_floor():
		$AnimationPlayer.play("idle")
		print("idle")
		
	if is_on_floor() and jump:
		$AnimationPlayer.play("jump")
		print("jump")
		velocity.y = jump_speed
		can_double_jump = true
	if !is_on_floor() and jump  and can_double_jump:
		velocity.y = jump_speed
		can_double_jump = false
		
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _physics_process(delta):
	get_input()
