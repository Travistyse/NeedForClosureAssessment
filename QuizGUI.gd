extends Control

var QuestionTextLabel# = $QuestionLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	QuizManager.QuizGUI = self
	QuizManager.QuizGuiScript = self.get_script
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func SetQuestionText(Text : String):
	QuestionTextLabel.set_text(Text)

func _on_previous_button_pressed():
	pass # Replace with function body.


func _on_next_button_pressed():
	QuizManager.Proceed()


func _on_button_1_pressed():
	QuizManager.CurrentAnswer = 1


func _on_button_2_pressed():
	QuizManager.CurrentAnswer = 2


func _on_button_3_pressed():
	QuizManager.CurrentAnswer = 3


func _on_button_4_pressed():
	QuizManager.CurrentAnswer = 4


func _on_button_5_pressed():
	QuizManager.CurrentAnswer = 5


func _on_question_label_ready():
	QuestionTextLabel = QuizManager.QuizLabel #$QuestionLabel
	SetQuestionText(QuizManager.QuestionsArray[0])




func _on_button_6_pressed():
	QuizManager.CurrentAnswer = 6
