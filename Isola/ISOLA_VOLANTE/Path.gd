extends Path


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var PathFollow = get_node("PathFollow")


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PathFollow.set_offset(PathFollow.get_offset()+4*delta)
