//
//  SettingsViewController.swift
//  TicTacToe
//
//  Created by Alexander C on 2022-12-07.
//

import UIKit

protocol ClassSettingsViewControllerDelegate : AnyObject {
    func updatePlayerNames(name1 : String, name2 : String)
}

class SettingsViewController: UIViewController {
    weak var delegate: ClassSettingsViewControllerDelegate?
    
    @IBOutlet weak var singlePlayerSwitchOutlet: UISwitch!
    @IBOutlet weak var playerOneNameTextField: UITextField!
    @IBOutlet weak var playerTwoNameTextField: UITextField!
    
    var playerOneName : String = "Player 1"
    var playerTwoName : String = "Player 2"
    var playerTwoOriginalName : String?
    var singlePlayerMode = false
    var ticTacToe = Game()
    
    var randomNames = ["Charlie Chaplin", "Albert Einstein", "Stewen Hawkings", "Barack Obama", "James Bond", "Rihanna", "Danny Saucedo", "Megatron", "Batman", "Spider-man", "Superman", "Kim Kardashian", "Leif Loket Olsson", "Mahatma Gandhi", "Gordon Ramsay"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOneNameTextField.text = playerOneName
        playerTwoNameTextField.text = playerTwoName
        playerTwoOriginalName = playerTwoName
        
        singlePlayerMode = ticTacToe.fetchSinglePlayerStatus()
        singlePlayerSwitchOutlet.isOn = singlePlayerMode

    }
    
    @IBAction func updatePlayerName(_ sender: Any) {
        updateNames()
    }
    
    @IBAction func singlePlayerSwitch(_ sender: Any) {
        singlePlayerSwitchTrigger()
        
    }
    
    func updateNames(){
        delegate?.updatePlayerNames(name1: playerOneNameTextField.text ?? "Player 1",
                                    name2: playerTwoNameTextField.text ?? "Player 2")
    }
    
    func singlePlayerSwitchTrigger(){
        let randomName = generateRandomName()
        
        if singlePlayerSwitchOutlet.isOn {
            playerTwoName = randomName
            playerTwoNameTextField.text = randomName
            updateNames()
            singlePlayerMode = true
            ticTacToe.singlePlayerOnOff(on: true)
          

        } else {
            if playerTwoOriginalName != playerTwoOriginalName{
                playerTwoNameTextField.text = playerTwoOriginalName
            } else {
                playerTwoNameTextField.text = "Player 2"
            }
            updateNames()
            singlePlayerMode=false
            playerTwoNameTextField.isEnabled = true
            ticTacToe.singlePlayerOnOff(on: false)
        }
    }
    
    func generateRandomName() -> String{
        let random =  Int.random(in: 0..<randomNames.count)
        return "Bot: " + randomNames[random]
    }

    
    
}
