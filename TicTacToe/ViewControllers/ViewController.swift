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
    var player1Name = "Player 1"
    var player2Name = "Player 2"
    
    let ticTacToe = Game()
    var buttonsList = [UIButton]()
    
    var placeX = "X"
    var placeO = "O"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameButtons()
        a1Btn.tag = 0
        a2Btn.tag = 1
        a3Btn.tag = 2
        
        b1Btn.tag = 3
        b2Btn.tag = 4
        b3Btn.tag = 5
        
        c1Btn.tag = 6
        c2Btn.tag = 7
        c3Btn.tag = 8
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
    
    
    //Checks what player turn it is and displays the X/O-label according to the playerturn.
    //If the button title is not nil it will only check if the game is over and also
    //disable the current buttom so that the players cannot clicked already filled
    //buttons
    
    @IBAction func anyButtonPressed(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil){
            displayPlayerTurn()
            if ticTacToe.fetchXPlayerTurn() {
                sender.setTitle(placeX, for: .normal)
            } else {
                sender.setTitle(placeO, for: .normal)
            }
        }
        sender.isEnabled = false
        sender.setTitleColor(UIColor.white, for: .disabled)
        
        //placeonboard
        var isGameOver = ticTacToe.buttonPressed(clickCoordinatePosition: sender.tag)
        
        if isGameOver {
            resetBoard()
            isGameOver = false
        }
        
    }
    
    func resetBoard() {
        print("reset")
        for button in buttonsList {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
    }
    
    func displayPlayerTurn(){
        if ticTacToe.fetchXPlayerTurn() {playerTurnLabelOutlet.text = placeO}
        else                            {playerTurnLabelOutlet.text = placeX}
    }
    
}

