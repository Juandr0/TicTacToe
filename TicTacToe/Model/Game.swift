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
    
    var player1Score = 0
    var player2Score = 0
    
    init() {
        startGame()
    }
    
    func startGame (){
        //Represents coordinates a1-a3
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        
        //Represents coordinates b1-b3
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        
        //Represents coordinates c1-c3
        coordinatesList.append("empty")
        coordinatesList.append("empty")
        coordinatesList.append("empty")
    }
    
    func fetchXPlayerTurn() -> Bool {
        return xPlayerTurn
    }
    
    func fetchPlayerScore(player : String) -> Int {

        if (player == "playerOne"){
            return player1Score
        } else {
            return player2Score
        }
        
    }
    
    func resetGame (){
        startGame()
    }
    
    //Checks what player turn it is and displays the X/O according to the playerturn.
    //If the button title is not nil it will only check if the game is over and also
    //disable the current buttom so that the players cannot clicked already filled
    //buttons
    
    open func placeOnBoard(ViewButtonId : Int) -> Bool{
        
        if xPlayerTurn {
            coordinatesList[ViewButtonId] = placeX
        } else {
            coordinatesList[ViewButtonId] = placeO
        }
        //Adds point to the winners total score
        if checkForWin() {
            if xPlayerTurn {player1Score += 1}
            else           {player2Score += 1}
            
            coordinatesList.removeAll()
            startGame()
            xPlayerTurn = true
            return true
        }
        
        if checkForDraw(){
            coordinatesList.removeAll()
            startGame()
            xPlayerTurn = true
            return true
        }
        xPlayerTurn = !xPlayerTurn
        return false
    }
    
    
    //Looks if any of the remaining coordinates is set to the value "empty".
    //If no coordinates are empty it will return true, which indicates a draw since-
    //there are no buttons left to click on.
    func checkForDraw() -> Bool {
        for coordinate in coordinatesList {
            if coordinate == "empty" {
                return false
            }
        }
        return true
    }
    
    
    //Returns true if any player get three pieces of the same kind in a row.
    func checkForWin() -> Bool{
        
        var symbol : String
        if xPlayerTurn {symbol = "X"}
        else           {symbol = "O"}
        
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

