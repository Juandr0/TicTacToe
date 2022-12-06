//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alexander C on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    
    //Label that displays whos turn it is
    @IBOutlet weak var playerTurnLabelOutlet: UILabel!
    
    //Game buttons
    @IBOutlet weak var a1Btn: UIButton!
    @IBOutlet weak var a2Btn: UIButton!
    @IBOutlet weak var a3Btn: UIButton!
    
    @IBOutlet weak var b1Btn: UIButton!
    @IBOutlet weak var b2Btn: UIButton!
    @IBOutlet weak var b3Btn: UIButton!
    
    @IBOutlet weak var c1Btn: UIButton!
    @IBOutlet weak var c2Btn: UIButton!
    @IBOutlet weak var c3Btn: UIButton!
    
    //Initiates the game from class "Game"
    let TicTacToe = Game(player1: "Player 1", player2: "Player2")
    
    
    var buttonsList = [UIButton]()
    var xPlayerTurn = true

    var placeX = "X"
    var placeO = "O"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameButtons()
        TicTacToe.startGame(buttonsList: buttonsList)
    }

    //Adds the buttons to a list
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
    
    //Changes playerturn label on buttonclick
    //and runs the Game-class finction buttonPressed, that will handle the logic
    @IBAction func anyButtonPressed(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil){
            displayPlayerTurn()
            if xPlayerTurn == true {
                    sender.setTitle(placeX, for: .normal)
                } else {
                    sender.setTitle(placeO, for: .normal)
                }
            }
            sender.isEnabled = false
            sender.setTitleColor(UIColor.white, for: .disabled)
        
        TicTacToe.buttonPressed(sender, xPlayerTurn:xPlayerTurn)
        xPlayerTurn = !xPlayerTurn
    }
    
    func displayPlayerTurn(){
        if xPlayerTurn {playerTurnLabelOutlet.text = placeO}
        else           {playerTurnLabelOutlet.text = placeX}
    }
    
}

