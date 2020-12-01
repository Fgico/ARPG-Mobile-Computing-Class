extends Combattente

var attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")
var target = "player"

onready var manager = get_parent()
onready var anim = get_node("rotable/Skeleton/AnimationPlayer")
var path = null

var morto = false

func _ready():
	self.iniziaStats(1.5,1,20,1,300)
	

func _physics_process(delta):
	if( not morto):
		stunned -= delta
		if(stunned < 1):
			anim.playback_speed = 1
		if(manager.player != null):
			var from = manager.nav.get_closest_point(self.global_transform.origin)
			var to = manager.nav.get_closest_point(manager.player.global_transform.origin)
			path = manager.nav.get_simple_path(from,to)
		if(path != null):
			setTargetDir(path[1]-path[0])
		.physics_process(delta)
		if stato == Moving:
			anim.play("SkeletonArmature|Skeleton_Running")

func hit(danno,nelement):
	stunned = 2
	anim.playback_speed = 0
	.hit(danno,nelement)
	print(stunned)

func muori():
	morto = true
	anim.play("SkeletonArmature|Skeleton_Death")

func _on_Area_body_entered(body):
	if(not morto):
		if(body.is_in_group(target)):
			attacca(attacco,target)
			anim.play("SkeletonArmature|Skeleton_Attack")
