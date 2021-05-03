extends Area2D

onready var gems: = 10

signal updateGems(gms)
signal coins_collected(g,n)

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var player_vars = get_node("/root/PlayerVariables")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	$Sprite.play("gems")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Area2D_body_entered(body: Node) -> void:
	print(body.name)
	if body.name == "Player":
		$Sprite.stop()
		$Sprite.play("collect")
		player_vars.gems += 1
		print("Enter:",player_vars.gems)
		emit_signal("coins_collected",player_vars.gems,name)
		emit_signal("updateGems",player_vars.gems)
	

func _on_Sprite_animation_finished() -> void:
	if $Sprite.animation == "collect":
		queue_free()
		







func _on_Coins_body_entered(body):
	print(body.name)
	if body.name == "Player":
		$Sprite.stop()
		$Sprite.play("collect")
		player_vars.gems += 1
		print("Enter:",player_vars.gems)
		emit_signal("coins_collected",player_vars.gems,name)
		emit_signal("updateGems",player_vars.gems)
