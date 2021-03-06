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
public struct CollisionCategoryBitmask {
    static let Player: UInt32 = 0x00
    static let peopleWithOutHelp: UInt32 = 0x01
    static let peopleWithHelp: UInt32 = 0x02
    static let enemy: UInt32 = 0x03
}

public class GameLayer: SKNode {
    
    //MARK:- Properties
    var player: SKSpriteNode?
    var enemy: SKSpriteNode?
    private var clouds = [SKSpriteNode]()
    private var background: SKSpriteNode?
    
    var lastCallToUpdate: TimeInterval = 0
    var timeVariation: TimeInterval = 0
    var movePointsPerSecond: CGFloat = 200.0
    var velocity = CGPoint.zero
    var enemyVelocity = CGPoint.zero
    var enemyMovePointsPerSecond: CGFloat = 50.0
    var characterMove: SKAction!
    var screenSize: CGSize!
    let safeArea: CGFloat = 100.0
    
    //MARK:- Constructor
    public init(size:CGSize) {
        super.init()
        screenSize = size
        setUpClouds(size: size)
        setGamePlayBackground(size: size)
        setUPPlayer(size: size)
        addCharacterTextures()
        setUPEnemy(size: size)
        
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
     Function to set the player into the scene
     - parameters: size: size of the screen to position the player into the scene
     */
    private func setUPEnemy(size: CGSize) {
        enemy = SKSpriteNode(imageNamed: "Enemy")
        enemy?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.1)
        enemy?.zPosition = 2
        enemy?.setScale(0.2)
        setEnemyPhysics(enemy: enemy!)
        addChild(enemy!)
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
    public func setCharacterPhysics(character: SKSpriteNode) {
        character.physicsBody = SKPhysicsBody(texture: character.texture!, size: character.size)
        character.physicsBody?.isDynamic = true
        character.physicsBody?.categoryBitMask = CollisionCategoryBitmask.Player
        character.physicsBody?.collisionBitMask = CollisionCategoryBitmask.peopleWithOutHelp
        character.physicsBody?.contactTestBitMask = CollisionCategoryBitmask.peopleWithOutHelp
    }
    
    /**
     Function that sets the character's physic
     - parameter character: character node to set the physics
     */
    public  func setEnemyPhysics(enemy: SKSpriteNode) {
        enemy.physicsBody = SKPhysicsBody(texture: enemy.texture!, size: enemy.size)
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.categoryBitMask = CollisionCategoryBitmask.enemy
        enemy.physicsBody?.collisionBitMask = CollisionCategoryBitmask.peopleWithHelp
        enemy.physicsBody?.contactTestBitMask = CollisionCategoryBitmask.peopleWithHelp
    }
    
    //MARK:- Game mecanic methods
    
    /**
     Function that moves the character through the screen
     
     - parameter sprite: node to be moved( the charcter)
     - parameter velocity: speed to move the node
     */
    public func moveCharacter(sprite: SKSpriteNode, velocity: CGPoint) {
        
        let amountToMove = CGPoint(x: velocity.x * CGFloat(timeVariation),
                                   y: velocity.y * CGFloat(timeVariation))
        
        sprite.position = CGPoint(
            x: sprite.position.x + amountToMove.x,
            y: sprite.position.y + amountToMove.y)
        
        rotateCharacter(characterSprite: sprite, direction: velocity)
    }
    
    
    /**
     Function that rotates the character's node towards the touch location
     - parameter characterSprite: character's node
     - parameter direction:  direction to rotate the character's node
     */
    public  func rotateCharacter(characterSprite: SKSpriteNode, direction: CGPoint) {
        characterSprite.zRotation = CGFloat(atan2(Double(direction.y), Double(direction.x)))
    }
    
    /**
     Function that moves the character towards the touch location
     - parameter node: character's node
     - parameter location: location of the touch
     */
    public func moveTowardTap(node: SKSpriteNode, location: CGPoint) {
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
     Function that moves the character towards the touch location
     - parameter node: character's node
     - parameter location: location of the touch
     */
    public func moveEnemyTowardPlayer(node: SKSpriteNode, location: CGPoint) {
        
        let moveVector = CGPoint(x: (location.x - node.position.x),
                                 y: (location.y - node.position.y))
        
        let length = CGFloat(sqrt(pow(moveVector.x, 2) + pow(moveVector.y, 2)))
        
        let direction = CGPoint(x: (moveVector.x / length),
                                y: (moveVector.y / length))
        
        enemyVelocity = CGPoint(x: direction.x * enemyMovePointsPerSecond,
                                y: direction.y * enemyMovePointsPerSecond)
    }
    
    /**
     Function to create
     - parameters: boy:
     */
    public  func createPeople(boy:Bool, withHelp: Bool, name: String) {
        let person: SKSpriteNode!
        
        if boy {
            person = SKSpriteNode(imageNamed: "Men")
        } else {
            person = SKSpriteNode(imageNamed: "Women")
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
    public func setPersonPhysicsBody(person: SKSpriteNode, personWithHelp: Bool) {
        
        person.physicsBody = SKPhysicsBody(texture: person.texture!, size: person.size)
        person.physicsBody?.isDynamic = true
        if personWithHelp {
            person.physicsBody?.categoryBitMask = CollisionCategoryBitmask.peopleWithHelp
            person.physicsBody?.collisionBitMask = CollisionCategoryBitmask.enemy
            person.physicsBody?.contactTestBitMask = CollisionCategoryBitmask.enemy
        } else {
            person.physicsBody?.categoryBitMask = CollisionCategoryBitmask.peopleWithOutHelp
            person.physicsBody?.collisionBitMask = CollisionCategoryBitmask.Player
            person.physicsBody?.contactTestBitMask = CollisionCategoryBitmask.Player
        }
        
    }
    
    /**
     Function that adds the character's texture to an array
     */
    public  func addCharacterTextures() {
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
    
    public func createPeopleWhoNeedsHelp(name: String) {
        
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
    public  func animateTextureChange() {
        
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
    public func stopTextureChangesAnimation() {
        player!.removeAction(forKey: "animation")
    }
    
    public  func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64(range.upperBound - range.lowerBound + 1)
        let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        return T(value)
    }
    
    /**
     Function that checks the bounds of the screen
     - parameter size: screen's size
     */
    public func checkBounds(size: CGSize) {
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
    public func updateTimeVariation(currentTime: TimeInterval) {
        if lastCallToUpdate > 0 {
            timeVariation = currentTime - lastCallToUpdate
        } else {
            timeVariation = 0
        }
        
        lastCallToUpdate = currentTime
    }
    
    /**
     Function that sets up the clounds in the firstScreen
     - parameter size: size of the screen
     */
    public func setUpClouds(size: CGSize) {
        
        var action: SKAction!
        let amountOfClounds = 4
        
        for index in 0..<amountOfClounds {
            let cloud = SKSpriteNode(imageNamed: "Cloud")
            cloud.zPosition = -1
            switch index {
            case 0 :
                cloud.position = CGPoint(x: size.width * 0.1, y: size.height * 0.76)
                action = SKAction.move(to: CGPoint(x: size.width * 0.4, y: size.height * 0.76), duration: 100.0)
                break
            case 1:
                cloud.position = CGPoint(x: size.width * 0.4, y: size.height * 0.76)
                action = SKAction.move(to: CGPoint(x: size.width * 0.1, y: size.height * 0.76), duration: 100.0)
                break
                
            case 2:
                cloud.position = CGPoint(x: size.width * 0.6, y: size.height * 0.76)
                action = SKAction.move(to: CGPoint(x: size.width * 0.8, y: size.height * 0.76), duration: 100.0)
                break
                
            case 3:
                cloud.position = CGPoint(x: size.width * 0.9, y: size.height * 0.76)
                action = SKAction.move(to: CGPoint(x: size.width * 0.7, y: size.height * 0.76), duration: 100.0)
                break
                
            default:
                
                break
                
            }
            cloud.run(action)
            clouds.append(cloud)
            addChild(clouds[index])
        }
    }
}
