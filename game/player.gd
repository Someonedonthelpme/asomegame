extends CharacterBody2D

@onready var _hp = $ProgressBar

func _physics_process(_delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 150
	move_and_slide()
	
@export var max_hp = 5

var hp: float = 5:
	set(value):
		hp = value
		update_progress()
func update_progress():
	_hp.value = (hp / max_hp) * 100

func take_damage(value):
	hp -= value
