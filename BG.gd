extends Node2D

var r = 255
var g = 255
var b = 255
onready var player_current_position = $"Player".position
var pos
export var timer = 0

onready var colour = $"ParallaxBackground/Purple Sky/Sprite"

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Start Scene")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(pos)
	var camLimitUP = $Player/Camera2D2.position.y - $"ParallaxBackground/Purple Sky".position.y
	$"ParallaxBackground/Purple Sky".position = Vector2($Player/Camera2D2.position.x,$Player/Camera2D2.position.y * camLimitUP)
	#$"ParallaxMiddle1/ParallaxLayerMiddle1".position = Vector2($Player/Camera2D2.position.x,$"ParallaxMiddle1/ParallaxLayerMiddle1".position.y)
	#$"ParallaxMiddle2/ParallaxLayerMiddle2".position = Vector2($Player/Camera2D2.position.x - 10,$"ParallaxMiddle2/ParallaxLayerMiddle2".position.y)
	
	colour.modulate = Color8(r,g,b)
	
	
func _on_Timer_timeout() -> void:
	g -= 1
	g   = clamp(g,72,255)
	b -= 1
	b = clamp(b,0,255)
	


func checkPointOnOff():
	$"Checkpoint/Off".visible = false
	$"Checkpoint/On".visible = true



func _on_WaitbeforSpawn_timeout() -> void:
	get_tree().change_scene("res://Level1.tscn")


func _on_Player_death() -> void:
	print("Signal received Death")
	$"Fallzone/WaitbeforSpawn".start()


func _on_Player_checkPoint(position) -> void:
	print(position)
	pos = position
