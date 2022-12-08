//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alexander C on 2022-11-29.
//

import UIKit


class ViewController: UIViewController, ClassSettingsViewControllerDelegate, UIAlertViewDelegate {

    
    
    //Settings-segue identifier
    let segueToSettings = "segueToSettingsView"
    
    //Label that displays whos turn it is to play
    @IBOutlet weak var playerTurnLabelOutlet: UILabel!
    @IBOutlet weak var playerTurnSymbolLabelOutlet: UILabel!
    
    
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
    var singlePlayer = false
    
    let ticTacToe = Game()
    var buttonsList = [UIButton]()
    
    
    
    //Initiates the game-buttons and places them into a list
    //then adds tag to every button to keep track of which-
    //button is pressed.
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameButtons()
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
            updatePlayerTurnDisplay()
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
            gameOverAlert()
            updatePlayerTurnDisplay()
            isGameOver = false
        }
        
    }
    
    //Result alert that displays the winner the round or if it is a draw, then resets the board
    //when user press "reset"
    func gameOverAlert(){
        let alertTitle : String
        let drawText = "The round ended as a draw"

        let endedAsDraw = ticTacToe.checkForDraw()
        let playerTurn = ticTacToe.fetchXPlayerTurn()
        
        let playerOneScore = ticTacToe.fetchPlayerScore(player: "playerOne")
        let playerTwoScore = ticTacToe.fetchPlayerScore(player: "playerTwo")
        
        let scoreBoardMessage = "\nTotal score" +
                                "\n\n\n\(playerOneName): \(playerOneScore)\n" +
                                "\(playerTwoName): \(playerTwoScore)"
        
        if endedAsDraw { alertTitle = drawText
        } else {
            if playerTurn {alertTitle = playerOneName + " won"
            } else {alertTitle = playerTwoName + " won"}
        }

        
        let alertController = UIAlertController(title: alertTitle, message: scoreBoardMessage, preferredStyle: .alert)
        // Creates OK button and add the board-reset functionality on OK-press
        let OKAction = UIAlertAction(title: "Reset", style: .default) { [self]
            (action: UIAlertAction!) in
            self.ticTacToe.restartGame()
            self.resetBoard()
        }
        alertController.addAction(OKAction)
       

        // Present Dialog message
        self.present(alertController, animated: true, completion: nil)
        

    }
    

    
    //Resets the button titles to nil and enables them again.
    func resetBoard() {

        if playerOneStarts{
            playerTurnLabelOutlet.text = placeX
            playerTurnLabelOutlet.text = playerOneName + " turn"
            
        }else {
            playerTurnLabelOutlet.text = placeO
            playerTurnSymbolLabelOutlet.text = playerTwoName + " turn"
            
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
            playerTurnLabelOutlet.text = playerOneName + " turn"
        }
        else                            {
            playerTurnSymbolLabelOutlet.text = placeO
            playerTurnLabelOutlet.text = playerTwoName + " turn"
        }
    }
    
    
    
    @IBAction func settingsButtonPressed(_ sender: Any) {

        performSegue(withIdentifier: segueToSettings, sender: self)
    }
    
    
    //Settings segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let settingsVC = segue.destination as? SettingsViewController {
            settingsVC.delegate = self
            settingsVC.playerOneName = playerOneName
            settingsVC.playerTwoName = playerTwoName
            settingsVC.singlePlayerMode = singlePlayer
        }
    }
    
    
    func updatePlayerNames(name1: String, name2: String) {
        playerOneName = name1
        playerTwoName = name2
        updatePlayerTurnDisplay()
    }

    func updateSingleplayerMode(singlePlayerModeOnOff: Bool) {
        singlePlayer = singlePlayerModeOnOff
    }
    

}


