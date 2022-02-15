//
//  ViewController.swift
//  Hero Quiz test-02
//
//  Created by kayesh Abhisheka on 2021-08-20.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedLevel = 0       // level view controller passed value
    
    @IBOutlet var answerB1: UIButton!
    @IBOutlet var answerB2: UIButton!
    @IBOutlet var answerB3: UIButton!
    
    @IBOutlet var lbl: UILabel!
    
    @IBAction func finishClicked(_ sender: Any) {
        
    }
    
    @IBOutlet var finishButton: UIButton!
    
    var points = 0
    var gems = 0
    var gold = 0
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pvc = segue.destination as! PointsViewController
        pvc.category = "Marvel"
        pvc.passedPoints = points
        pvc.questionCount = questionSet.count
        
        if points >= 5 {
            pvc.passedGems = 5
        }
        pvc.passedGold = points * 2
    }
    
    
    
    @IBAction func bAction(_ sender: Any) {
        if (sender as AnyObject).tag == Int(rightAnswerPosition) {
//            print("correct")
            points += 1
        } else {
//            print("wrong. Qno:\(currentQuestion)")
        }
        
        if currentQuestion != questionSet.count {
            newQuestion()
        } else {
            finishButton.isHidden = false       //Show hidden finish button
        }
    }
    
    
    let questionSet1 = [
                     "The Asgardians refer to Earth as:",
                     "Who is the Stark family butler?",
                     "Odin is not the father of:",
                     "Black Panther is the king of:",
                     "Which of Tony's associates fights crime as War Machine?"
    ]
    let questionSet2 = [
                     "Thor's hammer can only be lifted by:",
                     "Where did Iron Man's origin story originally take place?",
                     "What's Captain America's real name?",
                     "T'Challa, the king of Wakanda, is also known as what superhero?",
                     "What symbol is on Captain America's shield?"
    ]
    let questionSet3 = [
                     "How did Tony's parents die?",
                     "In Avengers: Civil War, who does Captain America fight?",
                     "What is Captain America's shield made out of?",
                     "What is the name of the Hulk's human form?",
                     "Who is Captain America's best friend?"
    ]
    let answerSet1 = [
        ["Midgard", "The Blue Planet", "Utgard"],
        ["Edwin Jarvis", "alfred pennyworth", "reginald jeeves"],
        ["Loki", "Thor", "Balder"],
        ["Wakanda", "Kenya", "Uganda"],
        ["james rhodes", "pepper potts", "happy hogan"]
    ]
    let answerSet2 = [
        ["Those the hammer deems worthy", "Asgardians", "Thor himself"],
        ["Vietnam", "Kuwait", "Afghanistan"],
        ["Steve rogers", "Roger stevenson", "Reginald nation"],
        ["Black panther", "Kazar", "iron fist"],
        ["A star", "A dollar sign", "A stripe"]
    ]
    let answerSet3 = [
        ["Car accident", "Airplane accident", "Elevator accident"],
        ["Iron man", "Thor", "Captain Marvel"],
        ["Vibranium", "Adamantium", "Titanium alloy"],
        ["Bruce Banner", "Bruce Lee", "Bruce Forsyth"],
        ["Bucky Barnes", "Iron man", "Thor"]
    ]

    
    var currentQuestion = 0
    var rightAnswerPosition: UInt32 = 0
    
    var questionSet = [String]()
    var answerSet = [[String]]()

    
    func newQuestion() {
        
        if selectedLevel == 1 {
            questionSet = questionSet1
            answerSet = answerSet1
        } else if selectedLevel == 2 {
            questionSet = questionSet2
            answerSet = answerSet2
        } else if selectedLevel == 3 {
            questionSet = questionSet3
            answerSet = answerSet3
        } else {
            print("Something went wrong in Question & Answer set")
        }
        
        lbl.text = questionSet[currentQuestion]
        rightAnswerPosition = arc4random_uniform(3) + 1     //this arc4 function generate a random from 0 to 2. and add a 1
        
        var button = UIButton()
        var x = 1
        
        for i in 1...3 {
            button = view.viewWithTag(i) as! UIButton
            if i == Int(rightAnswerPosition) {
                button.setTitle(answerSet[currentQuestion][0], for: .normal)
            } else {
                button.setTitle(answerSet[currentQuestion][x], for: .normal)
                x += 1
            }
        }
        
        if selectedLevel == 1 {
            switch currentQuestion {
                case 0:
                    view.backgroundColor = .cyan
                case 1:
                    view.backgroundColor = .red
                case 2:
                    view.backgroundColor = .cyan
                case 3:
                    view.backgroundColor = .black
                case 4:
                    view.backgroundColor = .red
                default:
                    print("Something went wrong in changing colors set 1")
            }
        }   else if selectedLevel == 2 {
                switch currentQuestion {
                    case 0:
                        view.backgroundColor = .cyan
                    case 1:
                        view.backgroundColor = .red
                    case 2:
                        view.backgroundColor = .blue
                    case 3:
                        view.backgroundColor = .black
                    case 4:
                        view.backgroundColor = .blue
                    default:
                        print("Something went wrong in changing colors set 2")
            }
    }   else if selectedLevel == 3 {                    //Question set 3 colors
            switch currentQuestion {
                case 0:
                    view.backgroundColor = .red
                case 1:
                    view.backgroundColor = .blue
                case 2:
                    view.backgroundColor = .blue
                case 3:
                    view.backgroundColor = .green
                case 4:
                    view.backgroundColor = .blue
                default:
                    print("Something went wrong in changing colors set 3")
            }
    }
        
        currentQuestion += 1
        
    }


    
    override var prefersStatusBarHidden: Bool {         //Hide status bar
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerB1.layer.cornerRadius = 8
        answerB2.layer.cornerRadius = 8
        answerB3.layer.cornerRadius = 8
        
        finishButton.backgroundColor = UIColor.brown
        finishButton.layer.cornerRadius = finishButton.frame.height / 2
        finishButton.setTitleColor(UIColor.darkGray, for: .normal)
        
        finishButton.layer.shadowColor = UIColor.darkGray.cgColor
        finishButton.layer.shadowRadius = 5
        finishButton.layer.shadowOpacity = 0.5
        finishButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        lbl.layer.cornerRadius = lbl.frame.height / 2
        
        finishButton.isHidden = true        //hiding finish button until final question
        newQuestion()
    }


}

        
