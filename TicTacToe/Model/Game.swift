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
    var singlePlayerActivated = true
    
    let placeX = "X"
    let placeO = "O"
    
    var player1Score = 0
    var player2Score = 0
    var randomOnBoard = ""
    init() {
        startGame()
    }
    
    func startGame (){
        //Represents coordinates a1-a3
        coordinatesList.append("a1")
        coordinatesList.append("a2")
        coordinatesList.append("a3")
        
        //Represents coordinates b1-b3
        coordinatesList.append("b1")
        coordinatesList.append("b2")
        coordinatesList.append("b3")
        
        //Represents coordinates c1-c3
        coordinatesList.append("c1")
        coordinatesList.append("c2")
        coordinatesList.append("c3")
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
    
    open func placeRandomOnBoard() -> String{
        let randomCoordinateAsString = randomCoordinateGenerator()
        switch randomCoordinateAsString {
            
            case "a1": coordinatesList[0] = placeO
            return "a1"
            
            case "a2": coordinatesList[1] = placeO
            return "a2"
            
            case "a3": coordinatesList[2] = placeO
            return "a3"
            
            
            
            case "b1": coordinatesList[3] = placeO
            return "b1"
            
            case "b2": coordinatesList[4] = placeO
            return "b2"
            
            case "b3": coordinatesList[5] = placeO
            return "b3"
                
            
            
            
            case "c1": coordinatesList[6] = placeO
            return "c1"
            
            case "c2": coordinatesList[7] = placeO
            return "c2"
            
            case "c3": coordinatesList[8] = placeO
            return "c3"
            
        default:
            print("default")
        }
        return "default"
    }
    
    open func fetchPlaceRandomOnBoard() -> String{
        return randomOnBoard
    }
    
    
    open func placeOnBoard(ViewButtonId : Int) -> Bool{
        
        if xPlayerTurn {
            coordinatesList[ViewButtonId] = placeX
            if checkForWin() {
                if xPlayerTurn {player1Score += 1}
                else           {player2Score += 1}
                return true
            }
            xPlayerTurn = !xPlayerTurn
            if singlePlayerActivated {
                randomOnBoard = placeRandomOnBoard()
                if checkForWin() {
                    if xPlayerTurn {player1Score += 1}
                    else           {player2Score += 1}
                    return true
                }
        }

        } else {
            coordinatesList[ViewButtonId] = placeO

        }
        //Adds point to the winners total score
        if checkForWin() {
            if xPlayerTurn {player1Score += 1}
            else           {player2Score += 1}
            return true
        }
        
        if checkForDraw(){
            return true
        }
        
        if !singlePlayerActivated {xPlayerTurn = !xPlayerTurn}
        else {xPlayerTurn = true}
        return false
    }
    
    
    //Looks if any of the remaining coordinates is set to the value "empty".
    //If no coordinates are empty it will return true, which indicates a draw since-
    //there are no buttons left to click on.
    func checkForDraw() -> Bool {
        for coordinate in coordinatesList {
            
            if  coordinate == "a1" || coordinate == "a2" || coordinate == "a3" || coordinate == "b1" || coordinate == "b2" || coordinate == "b3" || coordinate == "c1" || coordinate == "c2" || coordinate == "c3"{
                return false
            }
        }
        return true
    }
    
    //Resets the gameboard logic
    open func restartGame(){
        coordinatesList.removeAll()
        startGame()
        xPlayerTurn = true
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
    
    func randomCoordinateGenerator() -> String{
        var emptySpaces = [String]()

        if coordinatesList.contains("a1") {emptySpaces.append("a1")}
        if coordinatesList.contains("a2") {emptySpaces.append("a2")}
        if coordinatesList.contains("a3") {emptySpaces.append("a3")}
        
        if coordinatesList.contains("b1") {emptySpaces.append("b1")}
        if coordinatesList.contains("b2") {emptySpaces.append("b2")}
        if coordinatesList.contains("b3") {emptySpaces.append("b3")}
        
        if coordinatesList.contains("c1") {emptySpaces.append("c1")}
        if coordinatesList.contains("c2") {emptySpaces.append("c2")}
        if coordinatesList.contains("c3") {emptySpaces.append("c3")}
        
        if emptySpaces.isEmpty == false{
            let randomNumber = Int.random(in: 0..<emptySpaces.count)
            print (emptySpaces[randomNumber])
            randomOnBoard = emptySpaces[randomNumber]
            return emptySpaces[randomNumber]
        }
        return emptySpaces[0]
    }
    
    func fetchSinglePlayerStatus() -> Bool {
        return singlePlayerActivated
    }
}

