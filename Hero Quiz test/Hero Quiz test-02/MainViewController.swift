//
//  MainViewController.swift
//  Hero Quiz test-02
//
//  Created by kayesh Abhisheka on 2021-08-21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    //    @IBOutlet var startButton: UIButton!
    
    @IBAction func StartDidClick(_ sender: Any) {
    }
    
    @IBOutlet var allGemslbl: UILabel!
    @IBOutlet var allGoldlbl: UILabel!
    
    
    var allGold = 0
    var allGems = 0
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    
    override var prefersStatusBarHidden: Bool {         //Hide status bar
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        print("Gold: \(allGold) Gems: \(allGems)")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        allGemslbl.text = String(allGems)
        allGoldlbl.text = String(allGold)
    }
    
    

}
