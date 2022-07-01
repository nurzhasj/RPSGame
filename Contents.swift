//
//  RockPaperScissors.swift
//  HereWeGo
//
//  Created by Nurbayev Nurzhas on 30.06.2022.

import Foundation

class RPSLogic {
    var g1: Gestures
    var g2: Gestures
    
    init(g1: Gestures, g2: Gestures) {
        self.g1 = g1
        self.g2 = g2
    }
    
    public func getWinnerMessage() -> String {
        if g1 == Gestures.ROCK && g2 == Gestures.PAPER {
            return """
                    you --> ROCK vs PAPER <-- computer
                                ///
                            /// LOST ///
                   """
        }else if g1 == Gestures.ROCK && g2 == Gestures.SCISSORS {
            return """
                    you --> ROCK vs SCISSORS <-- computer
                                ///
                            /// WON ///
                   """
        }else if g1 == Gestures.PAPER && g2 == Gestures.ROCK {
            return """
                    you --> PAPER vs ROCK <-- computer
                                ///
                            /// WON ///
                   """
        }else if g1 == Gestures.PAPER && g2 == Gestures.SCISSORS {
            return """
                    you --> PAPER vs SCISSORS <-- computer
                                ///
                            /// LOST ///
                   """
        }else if g1 == Gestures.SCISSORS && g2 == Gestures.ROCK {
            return """
                    you --> SCISSORS vs ROCK <-- computer
                                ///
                            /// LOST ///
                   """
        }else if g1 == Gestures.SCISSORS && g2 == Gestures.PAPER {
            return """
                    you --> SCISSORS vs PAPER <-- computer
                                ///
                            /// WON ///
                   """
        }else {
            return """
                    you --> \(g1) vs \(g2) <-- computer
                                ///
                            /// DRAW ///
                   """
        }
    }
}

class RockPaperScissors {
}

class Player: Choicable {
    var playerName: String?
    
    init(playerName: String = "Nurzhas") {
        self.playerName = playerName
    }
    
    func makeChoice(yourMove choice: Int) -> Gestures {
        switch choice {
        case 1:
            return Gestures.ROCK
        case 2:
            return Gestures.PAPER
        case 3:
            return Gestures.SCISSORS
        default:
            return Gestures.ROCK
        }
    }
}

class Computer {
    var computerChoice: Gestures = Gestures.ROCK
    
    init() {
        computerChoice = randomizeChoice()
    }
    
    public func makeChoice() -> Gestures {
        return computerChoice
    }
    
    public func randomizeChoice() -> Gestures {
        let randomNum = Int.random(in: 1...3)
        
        switch randomNum {
        case 1:
            return Gestures.ROCK
        case 2:
            return Gestures.PAPER
        case 3:
            return Gestures.SCISSORS
        default:
            return Gestures.ROCK
        }
    }
}

protocol Choicable {
    func makeChoice(yourMove choice: Int) -> Gestures
}

enum Gestures {
    case ROCK
    case PAPER
    case SCISSORS
}

var player = Player(playerName: "Nurzhas")

var playerChoice = player.makeChoice(yourMove: 2)
var computerChoice = Computer().makeChoice()

var logic = RPSLogic(g1: playerChoice, g2: computerChoice)

print(logic.getWinnerMessage())



