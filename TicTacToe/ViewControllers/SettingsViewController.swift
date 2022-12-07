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
    func updatePlayerNames(name1: String, name2: String) {
        playerOneNameTextField.text = name1
        playerTwoNameTextField.text = name2
    }
    
    
    weak var delegate: ClassSettingsViewControllerDelegate?
    
    
    @IBOutlet weak var playerOneNameTextField: UITextField!
    @IBOutlet weak var playerTwoNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func updatePlayerName(_ sender: Any) {
        delegate?.updatePlayerNames(name1: playerOneNameTextField.text ?? "Player 1",
                                    name2: playerTwoNameTextField.text ?? "Player 2")
    }
    
   
}
