extends CanvasLayer



# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite.play("gems")
	$gems.text = str(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func updateGems(gemsCount):
	$gems.text = str(gemsCount)

func updateLive(life):
	print(life)
	match life:
		3:
			$Live1.play("full")
			$Live2.play("full")
			$Live3.play("full")
			
		2:
			$Live1.play("full")
			$Live2.play("full")
			$Live3.play("empty")
		1:
			$Live1.play("full")
			$Live2.play("empty")
			$Live3.play("empty")
		0:
			$Live1.play("empty")
			$Live2.play("empty")
			$Live3.play("empty")
		
	


func _on_Player_updateHealth(life) -> void:
	updateLive(life)


func _on_Coins_updateGems(gems_count) -> void:
	updateGems(gems_count)
