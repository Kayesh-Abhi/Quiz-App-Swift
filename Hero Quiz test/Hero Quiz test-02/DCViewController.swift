//
//  DCViewController.swift
//  Hero Quiz test-02
//
//  Created by kayesh Abhisheka on 2021-08-21.
//

import UIKit

class DCViewController: UIViewController {
    
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
        pvc.category = "DC"
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
                     "Who is Gotham’s Clown Prince of Crime?",
                     "What is Superman’s weakness?",
                     "What is Batman’s secret identity?",
                     "Who is this nimble cat burglar?",
                     "What piece of jewelry does each Green Lantern wear?"
        ]
    let questionSet2 = [
                     "What is the main superhero team of the DC Universe?",
                     "Where does Wonder Woman come from?",
                     "Which city is protected by Batman?",
                     "Who is this electrically empowered hero?",
                     "Which villain broke Batman’s spine?"
        ]
    let questionSet3 = [
                     "What planet is Superman from?",
                     "What does Wonder Woman’s lasso do to people?",
                     "Where was Green Arrow stuck after his vehicle crashed?",
                     "Who is the Joker’s paramour?",
                     "Name Batman’s first Robin."
    ]
    let answerSet1 = [
        ["Joker", "Mad Hatter", "Black Mask"],
        ["Kryptonite", "Nth Metal", "Speed Force"],
        ["Bruce Wayne", "Hal jordan", "harvey dent"],
        ["Catwoman", "Bronze Tiger", "Knightfall"],
        ["Ring", "Watch", "Gauntlet"]
    ]
    let answerSet2 = [
        ["Justice League", "Guardians of the globe", "Teen Titans"],
        ["Themyscira", "Avalon", "viltrum"],
        ["Gotham", "New York", "Metropolis"],
        ["Black Lightning", "Kang", "Static"],
        ["Bane", "Joker", "Hugo strange"]
    ]
    let answerSet3 = [
        ["Krypton", "viltrum", "Asgard"],
        ["Make them tell the truth", "Make them reveal their true identity", "Make them surrender"],
        ["A deserted island", "Kamar taj", "A remote mountain peak"],
        ["Harley Quinn", "Pamela Isley", "Cat woman"],
        ["Dick Grayson", "Jason Todd", "Damian Wayne"]
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
        
        
        if selectedLevel == 1 {                             //Question set 1 colors
            switch currentQuestion {
                case 0:
                    view.backgroundColor = .purple
                case 1:
                    view.backgroundColor = .blue
                case 2:
                    view.backgroundColor = .black
                case 3:
                    view.backgroundColor = .black
                case 4:
                    view.backgroundColor = .green
                default:
                    print("Something went wrong in changing colors set 1")
            }
        } else if selectedLevel == 2 {      //Question set 2 colors
            switch currentQuestion {
                case 0:
                    view.backgroundColor = .yellow
                case 1:
                    view.backgroundColor = .yellow
                case 2:
                    view.backgroundColor = .black
                case 3:
                    view.backgroundColor = .black
                case 4:
                    view.backgroundColor = .black
                default:
                    print("Something went wrong in changing colors set 2")
            }
        }   else if selectedLevel == 3 {
                switch currentQuestion {
                    case 0:
                        view.backgroundColor = .blue
                    case 1:
                        view.backgroundColor = .yellow
                    case 2:
                        view.backgroundColor = .green
                    case 3:
                        view.backgroundColor = .purple
                    case 4:
                        view.backgroundColor = .black
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
        
        finishButton.layer.cornerRadius = finishButton.frame.height / 2

        finishButton.isHidden = true        //hiding finish button until final question
        newQuestion()
    }
    



}
