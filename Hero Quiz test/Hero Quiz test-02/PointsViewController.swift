//
//  PointsViewController.swift
//  Hero Quiz test-02
//
//  Created by kayesh Abhisheka on 2021-08-20.
//

import UIKit

class PointsViewController: UIViewController {
    
    
    @IBAction func NextLevelClick(_ sender: Any) {
        if category == "Marvel" {
            self.performSegue(withIdentifier: "MarvelLevelsSegue", sender: nil)
        } else if category == "DC" {
            self.performSegue(withIdentifier: "DCLevelsSegue", sender: nil)
        } else if category == "Random" {
            self.performSegue(withIdentifier: "RandomLevelsSegue", sender: nil)
        }

    }
    
    let MV = MainViewController()
    
    
    @IBOutlet var Goldlbl: UILabel!         //Gold Label
    @IBOutlet var Gemslbl: UILabel!         //Gems Label
    
    
    @IBAction func nextQuizDidClick(_ sender: Any) {        //Next Quiz button action
    }
    @IBAction func HomeDidClick(_ sender: Any) {            //Home button action
    }
    
        
    //Selecting segue according to clicked button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "ShowMainVC1":
                if let MVC = segue.destination as? MainViewController {     //main view controller segue
                    MVC.allGems = passedGems
                    MVC.allGold = passedGold
                }
            case "ShowHomeVC1":
                if let _ = segue.destination as? HomeViewController {       //Quiz category selecting view contrloller segue
                }
            case "MarvelLevelsSegue":
                if let passLevelM = segue.destination as? MarvelLevelsViewController {
                    passLevelM.achievedLevel = lvl
                }
            case "DCLevelsSegue":
                if let passLevelD = segue.destination as? DCLevelsViewController {
                    passLevelD.achievedLevel = lvl
                }
            case "RandomLevelsSegue":
                if let passLevelR = segue.destination as? RandomLevelsViewController {
                    passLevelR.achievedLevel = lvl
                }
            default:
                print("Something went wrong with segues")
            break
        }
    }
    
    
    var category = ""
    var passedPoints = 0
    var questionCount = 0
    var passedGems = 0
    var passedGold = 0
    var lvl:String?
    
    
    override var prefersStatusBarHidden: Bool {         //Hide status bar
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let pp = String(passedPoints)
        let qc = String(questionCount)
        
        print("")
        print(category)
        
        Goldlbl.text = String(passedGold)       //setting Gold label text as passed Gold label value
        Gemslbl.text = String(passedGems)       //setting Gems label text as passed Gems label value
        
        print("Score: \(pp) / \(qc) " )
        print("Gems: \(passedGems)")
        print("Gold: \(passedGold)")
        
        if passedPoints > 4 {
            lvl = "L3"
        } else if passedPoints > 2 {
            lvl = "L2"
        }

    }
    

}
