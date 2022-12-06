//
//  Game.swift
//  TicTacToe
//
//  Created by Alexander C on 2022-12-01.
//

import Foundation
import UIKit

class Game {
    var coordinatesList = [String]()
    var xPlayerTurn = true
    let placeX = "X"
    let placeO = "O"
    
    init() {
        startGame()
    }
    
    func startGame (){
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        coordinatesList.append("empty")
    }
    
    func fetchXPlayerTurn() -> Bool {
        return xPlayerTurn
    }
    
    func resetGame (){
        startGame()
    }
    
    //Checks what player turn it is and displays the X/O according to the playerturn.
    //If the button title is not nil it will only check if the game is over and also
    //disable the current buttom so that the players cannot clicked already filled
    //buttons
    
    open func buttonPressed(clickCoordinatePosition : Int) -> Bool{
        
        if xPlayerTurn {
            coordinatesList[clickCoordinatePosition] = placeX
        } else {
            coordinatesList[clickCoordinatePosition] = placeO
        }
        
        if checkForWin() {
            print("Win")
            coordinatesList.removeAll()
            startGame()
            return true
        }
        
        if checkForDraw(){
            print("Draw")
            coordinatesList.removeAll()
            startGame()
            return true
        }
        xPlayerTurn = !xPlayerTurn
        return false
    }
    
    func checkForDraw() -> Bool {
        for coordinate in coordinatesList {
            if coordinate != "empty" {
                return false
            }
        }
        return true
    }
    
    
    func checkForWin() -> Bool{
        
        var symbol : String
        if xPlayerTurn {symbol = "X"}
        else {symbol = "O"}
        
        //returns true if the symbols are the same on the horizontal line
        if  coordinatesList[0] == symbol &&
            coordinatesList[1] == symbol &&
            coordinatesList[2] == symbol {
            return true
        }
        if  coordinatesList[3] == symbol &&
            coordinatesList[4] == symbol &&
            coordinatesList[5] == symbol {
            return true
        }
        if  coordinatesList[6] == symbol &&
            coordinatesList[7] == symbol &&
            coordinatesList[8] == symbol {
            return true
        }
        
        //returns true if the symbols are the same on the diagonal line
        if  coordinatesList[0] == symbol &&
            coordinatesList[4] == symbol &&
            coordinatesList[8] == symbol {
            return true
        }
        
        if  coordinatesList[2] == symbol &&
            coordinatesList[4] == symbol &&
            coordinatesList[6] == symbol {
            return true
        }
        
        
        //returns true if the symbols are the same on the vertical line
        if  coordinatesList[0] == symbol &&
            coordinatesList[3] == symbol &&
            coordinatesList[6] == symbol {
            return true
        }
        
        if  coordinatesList[1] == symbol &&
            coordinatesList[4] == symbol &&
            coordinatesList[7] == symbol{
            return true
        }
        
        if  coordinatesList[2] == symbol &&
            coordinatesList[5] == symbol &&
            coordinatesList[8] == symbol{
            return true
        }
        
        return false
    }
    
    
}

