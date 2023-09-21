extends Node2D
@onready var _enemy = $enemy
@onready var _player = $player
@onready var _turnbox = $turnbox
@export var global_speed = 200
var text = 0
var nowturn = 1
var enemy_flag: bool = true

func _ready():
	_player.hide()
	_enemy.hide()
	_turnbox.hide()
	$CanvasLayer.hide()
	
func _on_endturn_pressed():
	var x = _player.get_position()
	var y = _enemy.get_position()
	
	
	if y.x-x.x > 600:
		_enemy.set_position(x + Vector2(600, 0))
		print(_enemy.get_position())
	else:
		turn(x, nowturn)
		print(_enemy.get_position())
	nowturn += 1

func _on_debug_pressed():
	enemy_flag = false
	turn(_player.get_position(), 0)
	enemy_flag = true
	


func turn(player, now):
	if enemy_flag == false:
		walking(player)
	elif now <= 4:
		_enemy.set_position(player + Vector2(600-now*140, 0))
	else:
		_enemy.set_position(player + Vector2(600, 0))
		_player.take_damage(1)
		nowturn = 0
	updateturnbox()

func updateturnbox():
	if enemy_flag == true:
		text += 1
	else:
		text = 0
	_turnbox.text = "turn: %d" % [text]

func walking(player):
	_enemy.set_position(player + Vector2(600, 1200))
	await get_tree().create_timer(2).timeout
	_enemy.set_position(player + Vector2(600, 0))
#func _physics_process(delta):
#	_enemy.velocity = (_player.position-_enemy.position).normalized() * 150
#	_enemy.move_and_slide()



func _on_play_pressed():
	_player.show()
	_enemy.show()
	_turnbox.show()
	$CanvasLayer.show()
	$play.hide()
	await get_tree().create_timer(1.5).timeout
	_enemy.set_position(_player.get_position() + Vector2(600, 0))

