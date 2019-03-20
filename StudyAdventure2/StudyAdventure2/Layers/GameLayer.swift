//
//  GameLayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

//CategoryBitMask Struct 
struct CollisionCategoryBitmask {
    static let Player: UInt32 = 0x00
    static let peopleWithOutHelp: UInt32 = 0x01
    static let Platform: UInt32 = 0x02
    static let peopleWithHelp: UInt32 = 0x03
}

class GameLayer: SKNode {
    
    //MARK:- Properties
    private var player: SKSpriteNode?
    private var clouds = [SKSpriteNode]()
    private var background: SKSpriteNode?
    
    //MARK:- Constructor
    init(size:CGSize) {
        super.init()
        setGamePlayBackground(size: size)
        setUPPlayer(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods
    
    /**
     Function to set the player into the scene
     - parameters: size: size of the screen to position the player into the scene
     */
    private func setUPPlayer(size: CGSize) {
        player = SKSpriteNode(imageNamed: "CharacterBookWalk1")
        player?.position = CGPoint(x: size.width/2, y: size.height/2)
        player?.zPosition = 3
        player?.setScale(0.3)
        addChild(player!)
    }
    
    /**
     Function to se the background of the GamePlay
     - parameters: size: size of the screen
     */
    
    private func setGamePlayBackground(size:CGSize) {
        background = SKSpriteNode(imageNamed: "BackgroundGameScene")
        background?.position = CGPoint(x: size.width/2, y: size.height/2)
        background?.zPosition = -10
        addChild(background!)
    }
}
