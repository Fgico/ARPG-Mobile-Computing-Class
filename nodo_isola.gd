extends Spatial

onready var pianoAttuale = get_node("Isola_volante")
onready var player = get_node("player")

func _ready():
	pass # Replace with function body.


func cambioPiano(nuovoLivello):
	var newPiano = load(nuovoLivello)
	pianoAttuale.queue_free()
	var pianoCreato = newPiano.instance() #creo il nuovo piano
	self.add_child(pianoCreato)
	pianoAttuale = pianoCreato
	get_node("player/target/Camera").current = true
	userData.saveToFile()
	
	#aggiorno posizione player per ogni dungeon
	if( pianoAttuale.get_node("startPos") != null):
		var startPos = pianoAttuale.get_node("startPos")
		player.global_transform.origin = startPos.global_transform.origin
	
	#mostra comandi UI
	player.UI.show()