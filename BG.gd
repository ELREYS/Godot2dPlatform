extends Node2D

var r = 255
var g = 255
var b = 255
onready var player_current_position = $"Player".position
export var timer = 0


onready	var coins = preload("res://Coins.tscn")

onready var colour = $"ParallaxBackground/Purple Sky/Sprite"

onready var gemsCount = PlayerVariables.gems

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Start Scene")
	if PlayerVariables.player_position != null:
		print(PlayerVariables.player_position)
		$"Player".position = PlayerVariables.player_position
		print("Gems:",gemsCount)
	
	
	#var coin = coins.instance()
	#print(coin)
	
	#add_child(coin)
	# position the coin at the coin_spawn_node
	#coin.global_position = Vector2(443,296)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	


func checkPointOnOff(cp_name):
	pass
	


func _on_WaitbeforSpawn_timeout() -> void:
	if PlayerVariables.player_position != null:
		$"Player".position = PlayerVariables.player_position
	
	$Player.position = player_current_position


func _on_Player_death() -> void:
	print("Signal received Death")
	$"Fallzone/WaitbeforSpawn".start()
	
	
	


func _on_Player_checkPoint(pos,cp_name) -> void:
	print(pos)
	PlayerVariables.player_position = pos
	

func _on_Coins_coins_collected(g, n) -> void:
	pass # Replace with function body.
