extends KinematicBody2D

var moveSpeed = 100
var switchMove = false
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	$AnimationPlayer.play("Idle")
	$Timer.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(switchMove):
		velocity.x =0
		velocity = Vector2.RIGHT * moveSpeed
		velocity = move_and_slide(velocity,Vector2.UP)
	else:
		velocity.x =0
		velocity = Vector2.RIGHT * -moveSpeed
		velocity = move_and_slide(velocity,Vector2.UP)
	


func moveEnemy():
	pass


func _on_Timer_timeout() -> void:
	if switchMove == false: 
		switchMove = true
	else:
		switchMove = false
