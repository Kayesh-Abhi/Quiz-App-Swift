//
//  RandomViewController.swift
//  Hero Quiz test-02
//
//  Created by kayesh Abhisheka on 2021-08-21.
//

import UIKit

class RandomViewController: UIViewController {
    
    var selectedLevel = 0       // level view controller passed value
    
    @IBOutlet var answerB1: UIButton!
    @IBOutlet var answerB2: UIButton!
    @IBOutlet var answerB3: UIButton!
    
    
    @IBOutlet var lbl: UILabel!     //Question label
    
    @IBAction func finishClicked(_ sender: Any) {       //finish button action
    }    
    @IBOutlet var finishButton: UIButton!       //finish button property
    
    var points = 0
    var gems = 0
    var gold = 0
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pvc = segue.destination as! PointsViewController
        pvc.category = "Random"         //passing category name to point view controller
        pvc.passedPoints = points       //passing points to point view controller
        pvc.questionCount = questionSet.count       //passing question count to point view controller
        
        if points >= 5 {
            pvc.passedGems = 5      //setting Gem count
        }
        pvc.passedGold = points * 3     //setting Point count
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
                     "How does Rick hop across universes and dimensions?",
                     "What colour is Spongebob's tie?",
                     "Who does Sylvester often try to eat?",
                     "Where does Family Guy take place?",
                     "What is the name of Mickey's dog?"
    ]
    let questionSet2 = [
                     "What is Mr. Krabs' full name?",
                     "What character can turn into a tornado?",
                     "Who does Stewie want to kill?",
                     "What's the name of the dating app Jerry and Glootie develop?",
                     "Which of the following is not a Bart Simpson catch-phrase?"
    ]
    let questionSet3 = [
                     "Who is the mayor of Quahog?",
                     "What is the name of the Kingdom that Anna and Elsa live in?",
                     "What is Bugs Bunny's catchphrase?",
                     "Which of these words best describes Squidward?",
                     "What's the name of the colorful land Rick created for Beth when she was a kid?"
    ]
    let answerSet1 = [
        ["A portal gun", "A puzzle box", "Time machine"],
        ["Red", "Green", "Blue"],
        ["Tweety bird", "Porky Pig", "Wile E. Coyote"],
        ["Quahog", "New york", "Hardleyville"],
        ["Pluto", "Goofy", "Jupiter"]
    ]
    let answerSet2 = [
        ["Eugene H. Krabs", "Ernest H. Krabs", "Edward T. Krabs "],
        ["The Tasmanian Devil", "Sylvester", "Granny"],
        ["Lois", "Meg", "Peter"],
        ["Lovefinderrz", "Cupidr", "Ooh-La-Love"],
        ["wubba lubba dub dub", "Don't have a cow, man!", "Ay, caramba!"]
    ]
    let answerSet3 = [
        ["Adam West", "Burt ward", "Bill Bixby"],
        ["Arendelle", "Endonooole", "Urendille"],
        ["Eh... What's up, Doc?", "What's cracking?", "Be hoppy!"],
        ["Grumpy", "Excited", "Patient"],
        ["Froopyland", "Froopyville", "Derpytown"]
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
        }   else if selectedLevel == 2 {                    //Question set 2 colors
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
        
        lbl.layer.cornerRadius = 10
        
        answerB1.layer.cornerRadius = 8
        answerB2.layer.cornerRadius = 8
        answerB3.layer.cornerRadius = 8
        
        finishButton.layer.cornerRadius = finishButton.frame.height / 2         //round corners of finish button

        finishButton.isHidden = true        //hiding finish button until final question
        newQuestion()
    }
    


}
