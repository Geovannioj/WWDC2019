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
    var player: SKSpriteNode?
    private var clouds = [SKSpriteNode]()
    private var background: SKSpriteNode?
    
    var lastCallToUpdate: TimeInterval = 0
    var timeVariation: TimeInterval = 0
    var movePointsPerSecond: CGFloat = 200.0
    var velocity = CGPoint.zero
    var characterMove: SKAction!
    var screenSize: CGSize!
    let safeArea: CGFloat = 80.0
    
    //MARK:- Constructor
    init(size:CGSize) {
        super.init()
        screenSize = size
        setGamePlayBackground(size: size)
        setUPPlayer(size: size)
        addCharacterTextures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Set up Methods
    
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
    
    /**
     Function that sets the character's physic
     - parameter character: character node to set the physics
     */
    func setCharacterPhysics(character: SKSpriteNode) {
        character.physicsBody = SKPhysicsBody(texture: character.texture!, size: character.size)
        character.physicsBody?.isDynamic = true
        //        character.physicsBody?.categoryBitMask = UInt32(EnumBitmaskCategory.character.rawValue)
        //        character.physicsBody?.collisionBitMask = UInt32(EnumBitmaskCategory.book.rawValue)
        //        character.physicsBody?.contactTestBitMask = UInt32(EnumBitmaskCategory.book.rawValue)
    }
    
    
    //MARK:- Game mecanic methods
    
    /**
     Function that moves the character through the screen
     
     - parameter sprite: node to be moved( the charcter)
     - parameter velocity: speed to move the node
     */
    func moveCharacter(sprite: SKSpriteNode, velocity: CGPoint) {
        
        let amountToMove = CGPoint(x: velocity.x * CGFloat(timeVariation),
                                   y: velocity.y * CGFloat(timeVariation))
        
        sprite.position = CGPoint(
            x: sprite.position.x + amountToMove.x,
            y: sprite.position.y + amountToMove.y)
        
        rotateCharacter(characterSprite: player!, direction: velocity)
    }
    
    /**
     Function that rotates the character's node towards the touch location
     - parameter characterSprite: character's node
     - parameter direction:  direction to rotate the character's node
     */
    func rotateCharacter(characterSprite: SKSpriteNode, direction: CGPoint) {
        characterSprite.zRotation = CGFloat(atan2(Double(direction.y), Double(direction.x)))
    }
    
    /**
     Function that moves the character towards the touch location
     - parameter node: character's node
     - parameter location: location of the touch
     */
    func moveTowardTap(node: SKSpriteNode, location: CGPoint) {
        animateTextureChange()
        let moveVector = CGPoint(x: (location.x - node.position.x),
                                 y: (location.y - node.position.y))
        
        let length = CGFloat(sqrt(pow(moveVector.x, 2) + pow(moveVector.y, 2)))
        
        let direction = CGPoint(x: (moveVector.x / length),
                                y: (moveVector.y / length))
        
        velocity = CGPoint(x: direction.x * movePointsPerSecond,
                           y: direction.y * movePointsPerSecond)
    }
    
    /**
     Function that adds the character's texture to an array
     */
    func addCharacterTextures() {
        var textures:[SKTexture] = []
        for i in 1...3 {
            textures.append(SKTexture(imageNamed: "CharacterBookWalk\(i)"))
        }
        
        textures.append(textures[1])
        textures.append(textures[0])
        
        characterMove = SKAction.animate(with: textures, timePerFrame: 0.1)
    }
    
    /**
     Function that gets the textures in the textures array and animate them
     */
    func animateTextureChange() {
        
        if player!.action(forKey: "animation") == nil {
            player!.run(
                SKAction.repeatForever(characterMove),
                withKey: "animation")
        }
    }
    
    /**
     Function that stops the character's texture change,
     this way the character seems to be stopped on the screen
     */
    func stopTextureChangesAnimation() {
        player!.removeAction(forKey: "animation")
    }
    
    /**
     Function that checks the bounds of the screen
     - parameter size: screen's size
     */
    func checkBounds(size: CGSize) {
        let bottomLeft = CGPoint.zero
        let topRight = CGPoint(x: size.width, y: size.height * 0.65)
        
        if player!.position.x <= bottomLeft.x {
            
            player!.position.x = bottomLeft.x
            
            velocity.y = 0
            
        } else if player!.position.x >= topRight.x {
            
            player!.position.x = topRight.x
            
            velocity.y = 0
            
        } else if player!.position.y <= bottomLeft.y {
            
            player!.position.y = bottomLeft.y
            
            velocity.y = 0
            
        } else if player!.position.y >= topRight.y {
            
            player!.position.y = topRight.y
            
            velocity.y = 0
        }
    }
    
    /**
     Function responsable for updating the
     - parameter currentTime: time to check the
     */
    func updateTimeVariation(currentTime: TimeInterval) {
        if lastCallToUpdate > 0 {
            timeVariation = currentTime - lastCallToUpdate
        } else {
            timeVariation = 0
        }
        
        lastCallToUpdate = currentTime
    }
}
