//
//  RandomLevelsViewController.swift
//  Hero Quiz test-02
//
//  Created by kayesh Abhisheka on 2021-08-31.
//

import UIKit

class RandomLevelsViewController: UIViewController {

    var LQA:Int!
    var achievedLevel:String!
    
    
    @IBOutlet var L2button: UIButton!
    @IBOutlet var L3button: UIButton!
    
    
    @IBAction func L1action(_ sender: Any) {
        LQA = 1
    }
    
    @IBAction func L2action(_ sender: Any) {
        LQA = 2

    }
    
    @IBAction func L3action(_ sender: Any) {
        LQA = 3

    }
    
    override var prefersStatusBarHidden: Bool {         //Hide status bar
        return true
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let RQV = segue.destination as! RandomViewController
        RQV.selectedLevel = LQA
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        L2button.isHidden = true
        L3button.isHidden = true
        
        if achievedLevel == "L2" {
            L2button.isHidden = false
        } else if achievedLevel == "L3" {
            L3button.isHidden = false
            L2button.isHidden = false
        }
        
    }
    


}
