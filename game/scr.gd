extends Node2D
@onready var _enemy = $enemy
@onready var _player = $player
@export var global_speed = 225
func _on_endturn_pressed():
	var x = _player.get_position()
	var y = _enemy.get_position()
	
	if y.x-x.x > 600:
		_enemy.set_position(x + Vector2(600, 0))
	else:
		call_enemy(global_speed)
func call_enemy(speed):
	_enemy.velocity = Vector2(-150, 0) * speed
	_enemy.move_and_slide()
