//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alexander C on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    
    //Label that displays whos turn it is to play
    @IBOutlet weak var playerTurnLabelOutlet: UILabel!
    @IBOutlet weak var playerTurnSymbolLabelOutlet: UILabel!
    
    //Score label outlets
    @IBOutlet weak var playerOneScoreLabelOutlet: UILabel!
    @IBOutlet weak var playerTwoScoreLabelOutlet: UILabel!
    
    
    //Game-buttons
    @IBOutlet weak var a1Btn: UIButton!
    @IBOutlet weak var a2Btn: UIButton!
    @IBOutlet weak var a3Btn: UIButton!
    
    @IBOutlet weak var b1Btn: UIButton!
    @IBOutlet weak var b2Btn: UIButton!
    @IBOutlet weak var b3Btn: UIButton!
    
    @IBOutlet weak var c1Btn: UIButton!
    @IBOutlet weak var c2Btn: UIButton!
    @IBOutlet weak var c3Btn: UIButton!
    
    //Declares necessary variables and-
    //creates an instance of the game-class where the logic is placed
    
    var playerOneName = "Player 1"
    var playerTwoName = "Player 2"
    
    var placeX = "X"
    var placeO = "O"
    var playerOneStarts = true
    
    let ticTacToe = Game()
    var buttonsList = [UIButton]()
    
    
    
    //Initiates the game-buttons and places them into a list
    //then adds tag to every button to keep track of which-
    //button is pressed.
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameButtons()
        updatePlayerScore()
        updatePlayerTurnDisplay()
        
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
    //disables the cliicked button on click so that the players cannot click on already used buttons
    //If the button title is not nil it will only check if the game is over
    
    @IBAction func anyButtonPressed(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil){
            if ticTacToe.fetchXPlayerTurn() {
                sender.setTitle(placeX, for: .normal)
            } else {
                sender.setTitle(placeO, for: .normal)
            }
        }
        
        sender.isEnabled = false
        sender.setTitleColor(UIColor.white, for: .disabled)
        
        var isGameOver = ticTacToe.placeOnBoard(ViewButtonId: sender.tag)
        updatePlayerTurnDisplay()
        
        if isGameOver {
            resetBoard()
            updatePlayerScore()
            updatePlayerTurnDisplay()
            isGameOver = false
        }
        
    }
    

    
    //Resets the button titles to nil and enables them again.
    func resetBoard() {

        print("reset")
        if playerOneStarts{
            playerTurnLabelOutlet.text = placeX
            playerTurnLabelOutlet.text = playerTwoName + " Turn"
            
        }else {
            playerTurnLabelOutlet.text = placeO
            playerTurnSymbolLabelOutlet.text = playerOneName + " Turn"
            
        }
        
        for button in buttonsList {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
    }
    
    //Displays who's playing next by setting the corresponding label to "X" or "Y".
    func updatePlayerTurnDisplay(){
        
        if ticTacToe.fetchXPlayerTurn() {
            playerTurnSymbolLabelOutlet.text = placeX
            playerTurnLabelOutlet.text = playerOneName + " Turn"
        }
        else                            {
            playerTurnSymbolLabelOutlet.text = placeO
            playerTurnLabelOutlet.text = playerTwoName + " Turn"
        }
    }
    
    //Fetches the player score and displays it on the screen alongside the playername
    func updatePlayerScore(){
        var playerOneScore = ticTacToe.fetchPlayerScore(player: "playerOne")
        playerOneScoreLabelOutlet.text = playerOneName + ": " + String(playerOneScore)
        
        var playerTwoScore = ticTacToe.fetchPlayerScore(player: "playerTwo")
        playerTwoScoreLabelOutlet.text = playerTwoName + ": " + String(playerTwoScore)
        
    }
    
}

