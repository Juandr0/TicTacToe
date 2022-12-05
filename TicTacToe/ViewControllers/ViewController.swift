//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alexander C on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerTurnLabelOutlet: UILabel!
    
    @IBOutlet weak var a1Btn: UIButton!
    @IBOutlet weak var a2Btn: UIButton!
    @IBOutlet weak var a3Btn: UIButton!
    
    @IBOutlet weak var b1Btn: UIButton!
    @IBOutlet weak var b2Btn: UIButton!
    @IBOutlet weak var b3Btn: UIButton!
    
    @IBOutlet weak var c1Btn: UIButton!
    @IBOutlet weak var c2Btn: UIButton!
    @IBOutlet weak var c3Btn: UIButton!
    
    
    let TicTacToe = Game(player1: "Player 1", player2: "Player2")
    var buttonsList = [UIButton]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameButtons()
        TicTacToe.startGame(buttonsList: buttonsList)
    }


    func initGameButtons(){
        buttonsList.append(a1Btn)
        buttonsList.append(a2Btn)
        buttonsList.append(a3Btn)
        
        buttonsList.append(b1Btn)
        buttonsList.append(b2Btn)
        buttonsList.append(b3Btn)
        
        buttonsList.append(c1Btn)
        buttonsList.append(c2Btn)
        buttonsList.append(c3Btn)
    }
    
    @IBAction func anyButtonPressed(_ sender: UIButton) {
        TicTacToe.buttonPressed(sender)
    }
    
}

