extends Node2D

var QuizGUI = $Control
var QuizGuiScript # = QuizGUI.get_script()
var QuizLabel
var CurrentAnswer = 1
var Total = 0.0
var ATotal = 0.0
var BTotal = 0.0
var CTotal = 0.0
var DTotal = 0.0
var ETotal = 0.0

var AWeight = 10 * 6
var BWeight = 8 * 6
var CWeight = 6 * 6
var DWeight = 9 * 6
var EWeight = 8 * 6


var QuestionsArray = [
	"I think that having clear rules and order at work is essential for success.",
	"Even after I've made up my mind about something, I am always eager to consider a different opinion.",
	"I don't like situations that are uncertain.",
	"I dislike questions which could be answered in many different ways.", 
	"I like to have friends who are unpredictable.",
	"I find that a well ordered life with regular hours suits my temperament.", 
	"When dining out, I like to go to places where I have been before so that I know what to expect.",
	"I feel uncomfortable when I don't understand the reason why an event occurred in my life.",
	"I feel irritated when one person disagrees with what everyone else in a group believes.",
	"I hate to change my plans at the last minute.",
	"I don't like to go into a situation without knowing what I can expect from it.",
	"When I have made a decision, I feel relieved.",
	"When I am confronted with a problem, I'm dying to reach a solution very quickly.",
	"When I am confused about an important issue, I feel very upset.",
	"I would quickly become impatient and irritated if I would not find a solution to a problem immediately.",
	"I would rather make a decision quickly than sleep over it.",
	"Even if I get a lot of time to make a decision, I still feel compelled to decide quickly.",
	"I think it is fun to change my plans at the last moment.",
	"I enjoy the uncertainty of going into a new situation without knowing what might happen.",
	"My personal space is usually messy and disorganized.",
	"In most social conflicts, I can easily see which side is right and which is wrong.",
	"I almost always feel hurried to reach a decision, even when there is no reason to do so.",
	"I believe that orderliness and organization are among the most important characteristics of a good student.",
	"When considering most conflict situations, I can usually see how both sides could be right.",
	"I don't like to be with people who are capable of unexpected actions.",
	"I prefer to socialize with familiar friends because I know what to expect from them.",
	"I think that I would learn best in a class that lacks clearly stated objectives and requirements.",
	"When thinking about a problem, I consider as many different opinions on the issue as possible.",
	"I like to know what people are thinking all the time.",
	"I dislike it when a person's statement could mean many different things.",
	"It's annoying to listen to someone who cannot seem to make up his or her mind.",
	"I find that establishing a consistent routine enables me to enjoy life more.",
	"I enjoy having a clear and structured mode of life.",
	"I prefer interacting with people whose opinions are very different from my own.",
	"I like to have a place for everything and everything in its place.",
	"I feel uncomfortable when someone's meaning or intention is unclear to me.",
	"I always see many possible solutions to problems I face.",
	"I'd rather know bad news than stay in a state of uncertainty.",
	"I do not usually consult many different opinions before forming my own view.",
	"I dislike unpredictable situations.",
	"I dislike the routine aspects of my work (studies)."
]

var RArray = [
	0,
	1,
	0,
	0,
	1,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	1,
	1,
	1,
	0,
	0,
	0,
	1,
	0,
	0,
	1,
	1,
	0,
	0,
	0,
	0,
	0,
	1,
	0,
	0,
	1,
	0,
	0,
	0,
	1
]


# A0, B1, C2, D3, E4
var LetterArray = [
	0,
	4,
	3,
	4,
	1,
	0,
	1,
	3,
	4,
	0,
	1,
	2,
	2,
	3,
	2,
	2,
	2,
	1,
	1,
	0,
	3,
	2,
	0,
	4,
	1,
	1,
	0,
	4,
	3,
	3,
	3,
	0,
	0,
	4,
	0,
	3,
	4,
	3,
	4,
	1,
	0
]

var AnswersArray = [
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
]

var CurrentQuestion = 0 #0

func Begin():
	QuizGUI.SetQuestionText(QuestionsArray[CurrentQuestion] + " ( " + str(CurrentQuestion) + " / " + str(QuestionsArray.size() - 1) + " )")

func GoBack():
	if CurrentQuestion > 0:
		#AnswersArray[CurrentQuestion] = CurrentAnswer
		CurrentQuestion -= 1
	
	if CurrentQuestion > 0:
		QuizGUI.SetQuestionText(QuestionsArray[CurrentQuestion] + " ( " + str(CurrentQuestion) + " / " + str(QuestionsArray.size() - 1) + " )")

func Proceed():
	if CurrentQuestion < QuestionsArray.size():
		AnswersArray[CurrentQuestion] = CurrentAnswer
		CurrentQuestion += 1
	
	if CurrentQuestion < QuestionsArray.size():
		QuizGUI.SetQuestionText(QuestionsArray[CurrentQuestion] + " ( " + str(CurrentQuestion) + " / " + str(QuestionsArray.size() - 1) + " )")
	else:
		ShowResults()

func ShowResults():
	var i = -1
	var R = 0
	for Answer in AnswersArray:
		i+=1
		R = RArray[i]
		var Value = Answer
		if R:
			match Value:
				1: Value = 5
				2: Value = 4
				3: Value = 3
				4: Value = 2
				5: Value = 1
		
		match LetterArray[i]:
			0: ATotal += Value
			1: BTotal += Value
			2: CTotal += Value
			3: DTotal += Value
			4: ETotal += Value
		
		Total += Value
	
	QuizGUI.SetQuestionText("Congrats on finishing, your assessment is as follows: \n Total (0 - 82: Low, 205+ High): " + str(Total)
	+ AddLetterTotalLine(0)
	+ AddLetterTotalLine(1)
	+ AddLetterTotalLine(2)
	+ AddLetterTotalLine(3)
	+ AddLetterTotalLine(4)
	
	)

# In this case, A0, B1, C2, D3, E4
func AddLetterTotalLine(TotalType: int):
	var StringToReturn = "\n "
	
	match TotalType:
		0: StringToReturn += "Need For Order: "			+ str(ATotal) + " / " + str(AWeight) + "( " + str(ATotal / AWeight) + "% )"
		1: StringToReturn += "Need for Predictability: "+ str(BTotal) + " / " + str(BWeight) + "( " + str(BTotal / BWeight) + "% )"
		2: StringToReturn += "Need for Decisiveness: "	+ str(CTotal) + " / " + str(CWeight) + "( " + str(CTotal / CWeight) + "% )"
		3: StringToReturn += "Avoidance of Ambiguity: " + str(DTotal) + " / " + str(DWeight) + "( " + str(DTotal / DWeight) + "% )"
		4: StringToReturn += "Closed Mindedness: " 		+ str(ETotal) + " / " + str(EWeight) + "( " + str(ETotal / EWeight) + "% )"
	
	return StringToReturn
	
# Called when the node enters the scene tree for the first time.
func _ready():
	#QuizGuiScript = QuizGUI.get_script()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
