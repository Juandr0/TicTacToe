//
//  Game.swift
//  TicTacToe
//
//  Created by Alexander C on 2022-12-01.
//

import Foundation
import UIKit

class Game {
    var gameButtonsList = [UIButton]()
    

    var player1 : String
    var player2 : String
    
    init(player1 : String, player2 : String){
        self.player1 = player1
        self.player2 = player2
    }
    
    func startGame (buttonsList : [UIButton]){
        gameButtonsList = buttonsList
    }
    
    func resetGame (){
        
    }
    
    //Checks what player turn it is and displays the X//O according to the playerturn.
    //If the button title is not nil it will only check if the game is over
    
    func buttonPressed(_ sender: UIButton, xPlayerTurn : Bool, placeX : String, placeO : String){
        
        if (sender.title(for: .normal) == nil){
            if xPlayerTurn == true {
                sender.setTitle(placeX, for: .normal)

            } else {
                sender.setTitle(placeO, for: .normal)
            }
            
        }
        checkIfGameIsOver()
    }
    
    
    
    func checkIfGameIsOver() {
        for button in gameButtonsList {
            
        }
    }
}
