import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    
    
    @IBOutlet var singleStackView: UIStackView!
    
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multiStackView: UIStackView!
    
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var rangeLabel1: UILabel!
    @IBOutlet var rangeLabel2: UILabel!
    @IBOutlet var rangeSlider: UISlider!
    
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak",  type: .lion),
                     Answer(text: "Fish",  type: .cat),
                    Answer(text: "Carrots",  type: .rabbit),
                    Answer(text: "Corn",  type: .turtle)
            ]),
        
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming",  type: .turtle),
                    Answer(text: "Sleeping",type: .cat),
                    Answer(text: "Cuddling",  type: .rabbit),
                    Answer(text: "Eating",type: .lion)
            ]),
        
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type:  .cat),
                    Answer(text: "I get a little nervous",  type: .rabbit),
                    Answer(text: "I barely notice them", type:  .turtle),
                    Answer(text: "I love them", type:  .lion)
            ])
    ]

    var questionIndex = 0
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answers.append(currentAnswers[0])
        case singleButton2:
            answers.append(currentAnswers[1])
        case singleButton3:
            answers.append(currentAnswers[2])
        case singleButton4:
            answers.append(currentAnswers[3])
        default:
            break
        }

        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        if multiSwitch1.isOn {
            answers.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answers.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answers.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answers.append(currentAnswers[3])
        }

        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))

        answers.append(currentAnswers[index])
        nextQuestion()
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multiStackView.isHidden = true
        rangedStackView.isHidden = true

        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionLabel.text = currentQuestion.text
        navigationItem.title = "Question #\(questionIndex+1) "
        questionProgressView.setProgress(totalProgress, animated: true)

        switch currentQuestion.type {
            
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
            
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
        
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answers)
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multiStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangeSlider.setValue(0.5, animated: false)
        
        rangeLabel1.text = answers.first?.text
        rangeLabel2.text = answers.last?.text
    }
}
