//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mitch Sigley on 7/3/18.
//  Copyright © 2018 Mitch Sigley. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()

    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var xScore = 0
    var oScore = 0
    var tScore = 0
    
    var Win = 0
    
    let winningCombinations = [[0,1,2,3], [4 ,5,6,7], [8,9,10,11], [12,13,14,15], [0,5,10,15], [3,6,9,12], [0,4,8,12], [1,5,9,13], [2,6,10,14], [3,7,11,15]]
    
    
    var gameIsActive = true
    
    //Score Labels
    @IBOutlet weak var xScoreLabel: UILabel!
    @IBOutlet weak var tScoreLabel: UILabel!
    @IBOutlet weak var oScoreLabel: UILabel!

    @IBOutlet weak var label: UILabel!
    
    //Select O/X box
    @IBOutlet weak var Selector: UIView!
    
    //Restart button
    @IBOutlet weak var Restart: UIButton!

    
    @IBAction func selectO(_ sender: Any) {
        activePlayer = 2
        Selector.isHidden = true
    }
    
    @IBAction func selectX(_ sender: Any) {
        activePlayer = 1
        Selector.isHidden = true
    }
    
    //Two Player
    @IBAction func action(_ sender: AnyObject)
    {
        if  (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if  (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "x"),for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "o"),for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[2]] == gameState[combination[3]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    //x has won
                    print ("X Won")
                    label.text = "X has won!"
                    xScore += 1
                    xScoreLabel.text = "\(xScore)"
                }
                    
                else{
                    //o has won
                    print ("O Won")
                    label.text = "O has won!"
                    oScore += 1
                    oScoreLabel.text = "\(oScore)"
                }
                
                playAgainButton .isHidden = false;
                label.isHidden = false
            }
         }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false
        {
            label.text = "Draw!"
            print ("Tie")
            tScore += 1
            tScoreLabel.text = "\(tScore)"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
        

    }
    
    //Single Player
    @IBAction func action2(_ sender: AnyObject)
    {
//        if  (gameState[sender.tag-1] == 0 && gameIsActive == true)
//        {
//            gameState[sender.tag-1] = activePlayer
//
//            if  (activePlayer == 1)
//            {
//                sender.setImage(UIImage(named: "x"),for: UIControlState())
//                activePlayer = 2
//            }
//            else
//            {
//                sender.setImage(UIImage(named: "o"),for: UIControlState())
//                activePlayer = 1
//            }
//        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[2]] == gameState[combination[3]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    //x has won
                    print ("X Won")
                    label.text = "X has won!"
                    xScore += 1
                    xScoreLabel.text = "\(xScore)"
                }
                    
                else{
                    //o has won
                    print ("O Won")
                    label.text = "O has won!"
                    oScore += 1
                    oScoreLabel.text = "\(oScore)"
                }
                
                playAgainButton .isHidden = false;
                label.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false
        {
            label.text = "Draw!"
            print ("Tie")
            tScore += 1
            tScoreLabel.text = "\(tScore)"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
        
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...16
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Menu", ofType: "m4a")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch{
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func Slot(_ sender: UIButton) {
//        if sender.tag == 0 {
//            sender.setImage(
//                UIImage(named: "x"),
//                for: .normal
//            )
//            sender.tag = 1
//        }
//        else {
//            sender.setImage(
//                UIImage(named: "o"),
//                for: .normal
//            )
//            sender.tag = 0
//        }
//
//}

}
