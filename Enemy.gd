extends KinematicBody2D

var moveSpeed = 50
var switchMove = false
var gravity = 30
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var velocity = Vector2()
export var direction = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if direction == 1:
		$AnimatedSprite.flip_h = true
		print($CollisionShape2D.shape.extents)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float)-> void:
	
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	if is_on_ceiling():
		direction = direction * -1
	
	velocity.y += gravity	
	velocity.x = moveSpeed * direction
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
	
func moveEnemy():
	pass


func _on_Timer_timeout() -> void:
	if switchMove == false: 
		switchMove = true
	else:
		switchMove = false
