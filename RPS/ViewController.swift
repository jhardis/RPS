//
//  ViewController.swift
//  RPS
//
//  Created by Jonathan E. Hardis on 10/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playagainButton: UIButton!
    
    @IBAction func rockTouch(_ sender: Any) {
        // I realize that the following two statements aren't
        // the way the book suggests it, but putting the next
        // two statements here makes the most sense to me.
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        play(.rock)
    }
    
    @IBAction func paperTouch(_ sender: Any) {
        rockButton.isHidden = true
        scissorsButton.isHidden = true
        play(.paper)
    }
    
    @IBAction func scissorsTouch(_ sender: Any) {
        rockButton.isHidden = true
        paperButton.isHidden = true
        play(.scissors)
    }
    
    @IBAction func playTouch(_ sender: Any) {
        updateUI(.start)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI(.start)
    }

    func updateUI(_ state: GameState) {
        switch state {
        case .start:
            gameStatus.text = ""
            self.view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
            appSign.text = "🤖"
            playagainButton.isHidden = true
            rockButton.isHidden = false
            rockButton.isEnabled = true
            paperButton.isHidden = false
            paperButton.isEnabled = true
            scissorsButton.isHidden = false
            scissorsButton.isEnabled = true
            return
        case .win:
            gameStatus.text = "You Won!"
            self.view.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0.5, alpha: 1.0)
           return
        case .lose:
            gameStatus.text = "You Lose!"
            self.view.backgroundColor = UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1.0)
            return
        case .draw:
            gameStatus.text = "Draw!"
            self.view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.8, alpha: 1.0)
            return
        }
    }
    
    func play (_ playerChoice: Sign) {
        playagainButton.isHidden = false
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        let myChoice = randomSign()
        appSign.text = myChoice.emoji
        let newState = myChoice.faceoff(playerChoice)
        updateUI(newState)
    }
}

