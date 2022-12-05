//
//  Game.swift
//  TicTacToe
//
//  Created by Alexander C on 2022-12-01.
//

import Foundation
import UIKit

class Game {
    var xPlayerTurn = true
    var placeX = "X"
    var placeO = "O"
    
    var player1 : String
    var player2 : String
    
    init(player1 : String, player2 : String){
        self.player1 = player1
        self.player2 = player2
    }
    
    func startGame (buttonsList : [UIButton]){
         
    }
    
    func resetGame (){
        
    }
    
    func buttonPressed(_ sender: UIButton){


        
        
        if (sender.title(for: .normal) == nil){

            if xPlayerTurn == true {
                sender.setTitle(placeX, for: .normal)
            } else {
                sender.setTitle(placeO, for: .normal)
            }
            xPlayerTurn = !xPlayerTurn
        }

    }
}
