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
    
    //Checks what player turn it is and displays the X/O according to the playerturn.
    //If the button title is not nil it will only check if the game is over and also
    //disable the current buttom so that the players cannot clicked already filled
    //buttons
    
    func buttonPressed(_ sender: UIButton, xPlayerTurn : Bool, placeX : String, placeO : String){
        
        if (sender.title(for: .normal) == nil){
            if xPlayerTurn == true {
                sender.setTitle(placeX, for: .normal)
                
            } else {
                sender.setTitle(placeO, for: .normal)
            }
        }
        sender.isEnabled = false
        sender.setTitleColor(UIColor.white, for: .disabled)
        
        if checkForWin(xPlayerTurn: xPlayerTurn) {
            
            if xPlayerTurn {displayGameResult(result : "X")}
            else {displayGameResult(result: "O")}
            resetBoard()
        }
        
        if checkForDraw() {
            displayGameResult(result: "Draw")
            resetBoard()
        }
    }
    
    
    func checkForDraw() -> Bool {
        for button in gameButtonsList {
            if button.title(for: .normal) == nil{
                return false
            }
        }
        return true
    }
    
    
    func checkForWin(xPlayerTurn : Bool) -> Bool{
        
        var symbol : String
        if xPlayerTurn {symbol = "X"}
        else {symbol = "O"}
        
        //returns true if the symbols are the same on the horizontal line
        if  gameButtonsList[0].title(for: .normal) == symbol && gameButtonsList[1].title(for: .normal) == symbol && gameButtonsList[2].title(for: .normal) == symbol {
            return true
        }
        if  gameButtonsList[3].title(for: .normal) == symbol && gameButtonsList[4].title(for: .normal) == symbol && gameButtonsList[5].title(for: .normal) == symbol {
            return true
        }
        if  gameButtonsList[6].title(for: .normal) == symbol && gameButtonsList[7].title(for: .normal) == symbol && gameButtonsList[8].title(for: .normal) == symbol {
            return true
        }
        
        //returns true if the symbols are the same on the diagonal line
        if  gameButtonsList[0].title(for: .normal) == symbol && gameButtonsList[4].title(for: .normal) == symbol && gameButtonsList[8].title(for: .normal) == symbol {
            return true
        }
        
        if  gameButtonsList[2].title(for: .normal) == symbol && gameButtonsList[4].title(for: .normal) == symbol && gameButtonsList[6].title(for: .normal) == symbol {
            return true
        }
        
            
        //returns true if the symbols are the same on the vertical line
        if  gameButtonsList[0].title(for: .normal) == symbol && gameButtonsList[3].title(for: .normal) == symbol && gameButtonsList[6].title(for: .normal) == symbol {
            return true
        }
        
        
        if  gameButtonsList[1].title(for: .normal) == symbol && gameButtonsList[4].title(for: .normal) == symbol && gameButtonsList[7].title(for: .normal) == symbol {
            return true
        }
        
        if  gameButtonsList[2].title(for: .normal) == symbol && gameButtonsList[5].title(for: .normal) == symbol && gameButtonsList[8].title(for: .normal) == symbol {
            return true
        }
        
        return false
    }
    
    func resetBoard() {
        print("reset")
        for button in gameButtonsList {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
    }
    
    func displayGameResult(result : String) {
        let message = UIAlertController(title: result, message: nil, preferredStyle: .alert)
        
        
        print(result)
    }
}
