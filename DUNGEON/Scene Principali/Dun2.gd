extends Spatial

onready var fade2 = get_node("Transition2/ColorRect/AnimationFading2")
onready var animazione2 = get_node("AreaSbarre2/AnimationPlayer")
onready var camera2 = get_node("AreaSbarre2/Camera")

func _ready():
	$lowSphere/AnimationPlayer.play("oscillo")
	$lowSphere5/AnimationPlayer.play("oscillo5")
	$lowSphere7/AnimationPlayer.play("oscillo7")
	$lowSphere8/AnimationPlayer.play("oscillo8")
	pass # Replace with function body.


#PASSAGGIO 2°DUNGEON
func _on_AreaSbarre2_body_entered(body):
	if (body.is_in_group("player") and get_node("enemyMaster").contaNemici == 0):
		body.UI.hide()
		camera2.current = true
		animazione2.play("animazioneSbarre2")
	pass # Replace with function body.


func _on_AnimationPlayer_animation2_finished(animazioneSbarre2):
	fade2.play("fadetoblack2")
	pass # Replace with function body.


func _on_AnimationFading2_animation_finished(fadetoblack2):
	get_tree().root.get_node("nodo_isola").cambioPiano("res://Isola/ISOLA_VOLANTE/Isola_volante.tscn")
	pass # Replace with function body.
