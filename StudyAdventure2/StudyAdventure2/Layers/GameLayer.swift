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
    static let peopleWithHelp: UInt32 = 0x02
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
    let safeArea: CGFloat = 100.0
    
    //MARK:- Constructor
    init(size:CGSize) {
        super.init()
        screenSize = size
        setGamePlayBackground(size: size)
        setUPPlayer(size: size)
        addCharacterTextures()
//        createPeopleWhoNeedsHelp()
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
        player?.zPosition = 2
        player?.setScale(0.2)
        setCharacterPhysics(character: player!)
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
    private func setCharacterPhysics(character: SKSpriteNode) {
        character.physicsBody = SKPhysicsBody(texture: character.texture!, size: character.size)
        character.physicsBody?.isDynamic = true
        character.physicsBody?.categoryBitMask = CollisionCategoryBitmask.Player
        character.physicsBody?.collisionBitMask = CollisionCategoryBitmask.peopleWithOutHelp
        character.physicsBody?.contactTestBitMask = CollisionCategoryBitmask.peopleWithOutHelp
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
    private func rotateCharacter(characterSprite: SKSpriteNode, direction: CGPoint) {
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
     Function to create
     - parameters: boy:
     */
    private func createPeople(boy:Bool, withHelp: Bool, name: String) {
        let person: SKSpriteNode!
        
        if boy {
            person = SKSpriteNode(imageNamed: "Boy")
        } else {
            person = SKSpriteNode(imageNamed: "Girl")
        }
        
        if withHelp {
            setPersonPhysicsBody(person: person, personWithHelp: true)
            
        } else {
            setPersonPhysicsBody(person: person, personWithHelp: false)
            
        }
        
        person.position = CGPoint(x: randomNumber(inRange: 0...Int(screenSize.width - safeArea)),
                                  y: randomNumber(inRange: 0...Int(screenSize.height * 0.65)))
        person.zPosition = 2
        person.name = name
        addChild(person)
    }
    
    /**
     Function to set the person's physicsBody
     - parameter person: node of the person.
     */
    func setPersonPhysicsBody(person: SKSpriteNode, personWithHelp: Bool) {
        
        person.physicsBody = SKPhysicsBody(texture: person.texture!, size: person.size)
        person.physicsBody?.isDynamic = true
        if personWithHelp {
            person.physicsBody?.categoryBitMask = CollisionCategoryBitmask.peopleWithHelp
        } else {
            person.physicsBody?.categoryBitMask = CollisionCategoryBitmask.peopleWithOutHelp
        }
        person.physicsBody?.collisionBitMask = CollisionCategoryBitmask.Player
        person.physicsBody?.contactTestBitMask = CollisionCategoryBitmask.Player
    }
    
    /**
     Function that adds the character's texture to an array
     */
   private func addCharacterTextures() {
        var textures:[SKTexture] = []
        for i in 1...5 {
            textures.append(SKTexture(imageNamed: "CharacterBookWalk\(i)"))
        }

        
        characterMove = SKAction.animate(with: textures, timePerFrame: 0.1)
    }
    
    /**
     Function to create people who needs help into the game
     - parameters: name: Name of the people sprite
     */
    
    func createPeopleWhoNeedsHelp(name: String) {
        
        for i in 1...8 {
            if i % 2 == 0 {
                createPeople(boy: true, withHelp: false, name: name)
            } else {
                createPeople(boy: false, withHelp: false, name: name)
            }
        }
        
    }
    /**
     Function that gets the textures in the textures array and animate them
     */
    private func animateTextureChange() {
        
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
    
    public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64(range.upperBound - range.lowerBound + 1)
        let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        return T(value)
    }
    
    /**
     Function that checks the bounds of the screen
     - parameter size: screen's size
     */
   func checkBounds(size: CGSize) {
        let bottomLeft = CGPoint(x: size.width * 0.1, y: size.height * 0.1)
        let topRight = CGPoint(x: size.width * 0.9, y: size.height * 0.5)
        
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
