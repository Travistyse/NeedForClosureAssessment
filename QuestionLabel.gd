extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#QuizManager.QuizLabel = self

func _enter_tree():
	QuizManager.QuizLabel = self
	await get_tree().create_timer(.01).timeout
	QuizManager.Begin()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
