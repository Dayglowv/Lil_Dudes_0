extends Sprite2D

var collect = false

func _on_area_2d_body_entered(body):
	if body.get("TYPE") == "player" && collect == false:
		collect = true
		body.speed = 250
		$anim.play("collect")
		$Timer.start()

func _on_timer_timeout():
	get_parent().get_node("player").speed = 150
	queue_free()
