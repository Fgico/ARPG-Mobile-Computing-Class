extends Attacco 

func _ready():
	iniziaStats(50,Ghiaccio,60,1)

func _on_Area_body_entered(body):
	.hit(body)
	pass # Replace with function body.
