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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOneNameTextField.text = playerOneName
        playerTwoNameTextField.text = playerTwoName
        playerTwoOriginalName = playerTwoName
        singlePlayerSwitchOutlet.isOn = singlePlayerMode
        singlePlayerSwitchTrigger()
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
        
        if singlePlayerSwitchOutlet.isOn {
            playerTwoName = "AI-Player"
            playerTwoNameTextField.text = "AI-Player"
            print ("singleplayer")
            updateNames()
            singlePlayerMode = true
          
        } else {
            print ("muliplayer")
            if playerTwoOriginalName != "AI-Player"{
                playerTwoNameTextField.text = playerTwoOriginalName
            } else {
                playerTwoNameTextField.text = "Player 2"
            }
            updateNames()
            singlePlayerMode=false
            playerTwoNameTextField.isEnabled = true
            
        }
    }
}
