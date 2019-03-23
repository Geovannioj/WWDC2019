//
//  GameManager.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class GameManager {
    
    //MARK:- Properties
    var score: Int = 0
    var countDown: Int = 60
    var arKit: Int = 0
    var spriteKit: Int = 0
    var sceneKit: Int = 0
    var coreMl: Int = 0
    var won: Bool = false
    
    static let shared = GameManager()
    
    //MARK:- Manager's methods
    
    /**
     Function that creates a timer with SKActions
     
     - Returns: timer as SKAction
     */
    func TimerWithActions() -> SKAction {
        let waitASecond = SKAction.wait(forDuration: 1.0)
        
        let timerBlock = SKAction.run {
            if self.countDown > 0 {
                self.countDown -= 1
            } else {
                
            }
        }
        
        let sequence = SKAction.sequence([waitASecond, timerBlock])
        let repeatTimerActionForever = SKAction.repeatForever(sequence)
        return repeatTimerActionForever
    }
    
    /**
     Function to restart the game
     */
    func restartResults() {
        self.score = 0
        self.countDown = 60
        self.won = false
        self.arKit = 0
        self.sceneKit = 0
        self.spriteKit = 0
        self.coreMl = 0 
    }
}
