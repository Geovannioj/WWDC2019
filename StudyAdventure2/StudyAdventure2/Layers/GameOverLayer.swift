//
//  GameOverlayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverLayer: SKNode {
    
    //MARK:- properties
    private var backgroundImg: SKSpriteNode?
    private var playAgainBtn: SKSpriteNode?
    private var backToBegining: SKSpriteNode?
    
    //MARK:- constructor
    init(size: CGSize) {
        super.init()
        setPlayAgainBtn(size: size)
        setRestartEverything(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- class methods
    /**
     Function to choose if it is needed to show the win or lose gameover page
     - parameter won: bolean that shows if the game was won or not
     - parameter size: Size of the screen
     */
    func chooseBackGround(won: Bool, size: CGSize) {
        if won {
            backgroundImg = SKSpriteNode(imageNamed: "GameOverScene")
            backgroundImg?.position = CGPoint(x: size.width/2, y: size.height/2)
            backgroundImg?.zPosition = -10
            addChild(backgroundImg!)
            
        } else {
            backgroundImg = SKSpriteNode(imageNamed: "GameOverScene")
            backgroundImg?.position = CGPoint(x: size.width/2, y: size.height/2)
            backgroundImg?.zPosition = -10
            addChild(backgroundImg!)
    
        }
        
    }
    
    /**
     Function that puts the play again button on the screen
     */
    private func setPlayAgainBtn(size: CGSize) {
        playAgainBtn = SKSpriteNode(imageNamed: "PlayAgainBtn")
        playAgainBtn?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.1)
        playAgainBtn?.name = "playAgain"
        addChild(playAgainBtn!)
    }
    
    /**
     Function that puts the restart button on the screen
     */
    private func setRestartEverything(size: CGSize) {
        backToBegining = SKSpriteNode(imageNamed: "BackToBegining")
        backToBegining?.position = CGPoint(x: size.width * 0.8, y: size.height * 0.1)
        backToBegining?.name = "restartEverything"
        addChild(backToBegining!)
    }
    
}
