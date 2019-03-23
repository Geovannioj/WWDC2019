//
//  GameScene.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate  {
    
    //MARK:- properties
    private var gameLayer: GameLayer?
    private var hudLayer: HUDLayer?
    private var gameoverScene: GameOverScene?
    
    var lastTouchLocation: CGPoint?
    var limitPeopleSpriteKitCreation: Bool = false
    var limitPeopleSceneKitCreation: Bool = false
    var limitPeopleARKitCreation: Bool = false
    var limitPeopleCoreMLCreation: Bool = false
    private let gameGoal = 20
    
    //MARK:- constructor
    override init(size: CGSize) {
        super.init(size:size)
        
        setUpGameScenePhysics()
        setupGameLayer(size: size)
        setupHudLayer(size: size)
        gameoverScene = GameOverScene(size: size)
        GameManager.shared.startMusic(musicName: "GamePlay-Lovable_Clown_Sit_Com.mp3", node: self)
    
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- setup Methods
    
    /**
    function the set up the gameLayer
     - parameters: size: size of the screen to fit the layer
     */
    private func setupGameLayer(size: CGSize) {
        gameLayer = GameLayer(size: size)
        addChild(gameLayer!)
    }
    
    /**
     function the set up the hudLayer
     - parameters: size: size of the screen to fit the layer
     */
    private func setupHudLayer(size: CGSize) {
        hudLayer = HUDLayer(size: size)
        addChild(hudLayer!)
    }
    
    /**
     Function that sets up the scene's physic
     */
    func setUpGameScenePhysics() {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0  )
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }

    /**
     Function that connects the function MoveTowardTap of the gameLayer with the gameScene
     */
    func sceneTouched(touchLocation: CGPoint) {
        gameLayer?.moveTowardTap(node: (gameLayer?.player)!, location: touchLocation)
        gameLayer?.moveEnemyTowardPlayer(node: (gameLayer?.enemy)!, location: (gameLayer?.player?.position)!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sceneTouched(touchLocation: (touches.first?.location(in: self))!)
        
        if (touches.first?.location(in: self))! != lastTouchLocation {
            lastTouchLocation = (touches.first?.location(in: self))!
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        sceneTouched(touchLocation: (touches.first?.location(in: self))!)
    }
    
    func movimentationFunction() {
        if let lastTouchLocation = lastTouchLocation {
            let diff = CGPoint(x:lastTouchLocation.x - gameLayer!.player!.position.x,
                               y: lastTouchLocation.y - gameLayer!.player!.position.y)
            let length = CGFloat(sqrt(pow(Double(diff.x), 2.0) + pow(Double(diff.y), 2.0)))
            if length <= gameLayer!.movePointsPerSecond * CGFloat(gameLayer!.timeVariation) {
                gameLayer!.player!.position = lastTouchLocation
                gameLayer!.velocity = CGPoint.zero
                gameLayer!.stopTextureChangesAnimation()
            } else {
                
            }
        }
    }

    func enemyMovimentationFunction() {
        let diff = CGPoint(x:gameLayer!.player!.position.x - gameLayer!.enemy!.position.x,
                           y:gameLayer!.player!.position.y - gameLayer!.enemy!.position.y)
        let length = CGFloat(sqrt(pow(Double(diff.x), 2.0) + pow(Double(diff.y), 2.0)))
        if length <= gameLayer!.enemyMovePointsPerSecond * CGFloat(gameLayer!.timeVariation) {
            gameLayer!.enemy!.position = (gameLayer!.player?.position)!
            gameLayer!.enemyVelocity = CGPoint.zero
        }
    }
    /**
     Function responsable to set gameover, removing the nodes
     and restarting the countdown and game resulta
     - parameter won: boolean tha indicates if the game was won or not
     */
    func setGameOverParameters(won: Bool) {
        GameManager.shared.won = won
        gameoverScene?.gameOverLayer?.chooseBackGround(won: GameManager.shared.won, size: size)
        GameManager.shared.restartResults()
        gameLayer?.player!.removeAllChildren()
        self.removeFromParent()
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.view?.presentScene(gameoverScene!, transition: showScene)
    }
    
    /**
     Function to check if it is gameover or not
     - parameter countDown: the remain time
     - parameter score: amount of books gotten
     */
    func checkGameOver(countDown: Int, score: Int) {
        if countDown == 0 && score >= gameGoal   {
            
            let changeSceneBlock = SKAction.run({
                self.setGameOverParameters(won: true)
            })
            
            let sequence = SKAction.sequence([changeSceneBlock])
            self.run(sequence)
            
        } else if countDown == 0 && score < gameGoal {
            
            setGameOverParameters(won: false)
            
        }
    }
    override func update(_ currentTime: TimeInterval) {
        gameLayer!.updateTimeVariation(currentTime: currentTime)
        gameLayer!.moveCharacter(sprite: gameLayer!.player!,
                                 velocity: gameLayer!.velocity)
        movimentationFunction()
        
        gameLayer!.moveCharacter(sprite: (gameLayer?.enemy)!
            , velocity: (gameLayer?.enemyVelocity)!)
        enemyMovimentationFunction()
        
        gameLayer!.checkBounds(size: size)
        checkGameOver(countDown: GameManager.shared.countDown, score: GameManager.shared.score)
        managePeopleSpawn()
        updateHudScore()
        
    }
   
    /**
     Function responsible to update the hud result values
     */
    private func updateHudScore() {
        hudLayer!.timeTxt!.text = String(GameManager.shared.countDown)
        hudLayer!.scoreResult!.text = String(GameManager.shared.score)
        hudLayer!.scoreArKit!.text = String(GameManager.shared.arKit)
        hudLayer!.scoreCoreML!.text = String(GameManager.shared.coreMl)
        hudLayer!.scoreSceneKit!.text = String(GameManager.shared.sceneKit)
        hudLayer!.scoreSpriteKit!.text = String(GameManager.shared.spriteKit)
        
        
    }
    /**
     Function to manage the spawn people's spawn in the screen
     */
    private func managePeopleSpawn() {
        if (GameManager.shared.countDown >= 45 && !limitPeopleSpriteKitCreation) {
            gameLayer!.createPeopleWhoNeedsHelp(name: "SpriteKit")
            hudLayer!.showTeachFrameWork(name: "SpriteKit", size: size)
            limitPeopleSpriteKitCreation = true
            
        } else if (GameManager.shared.countDown < 45) &&
            (GameManager.shared.countDown >= 30)  &&
            !limitPeopleSceneKitCreation{
            
            gameLayer!.createPeopleWhoNeedsHelp(name: "SceneKit")
            hudLayer!.showTeachFrameWork(name: "SceneKit", size: size)
            limitPeopleSceneKitCreation = true
            
        } else if ( GameManager.shared.countDown < 30) &&
            (GameManager.shared.countDown >= 15 &&
                !limitPeopleARKitCreation) {
            
            gameLayer!.createPeopleWhoNeedsHelp(name: "ARKit")
            hudLayer!.showTeachFrameWork(name: "ARKit", size: size)
            limitPeopleARKitCreation = true
            
        } else if (GameManager.shared.countDown < 15) &&
            (GameManager.shared.countDown >= 0)  &&
            !limitPeopleCoreMLCreation{
            
            gameLayer!.createPeopleWhoNeedsHelp(name: "CoreML")
            hudLayer!.showTeachFrameWork(name: "CoreML", size: size)
            limitPeopleCoreMLCreation = true
        }
    }
   
    private func respawnPerson(name: String, position: CGPoint, withHelp: Bool) {
        let person: SKSpriteNode!
        
        if withHelp {
            person  = SKSpriteNode(imageNamed: "GoldenPersonBook")
        } else {
            person = SKSpriteNode(imageNamed: "Girl")
        }
        
        person.position = position
        gameLayer?.setPersonPhysicsBody(person: person, personWithHelp: false)
        person.name = name
        addChild(person)
    }
    
    /**
     Function that recreates people who needs help and manage with one to create
     */
    private func managePeopleReSpawn(position: CGPoint, withHelp: Bool) {
        if (GameManager.shared.countDown >= 45) {
            respawnPerson(name: "SpriteKit", position: position, withHelp: withHelp)
            
        } else if (GameManager.shared.countDown < 45) &&
            (GameManager.shared.countDown >= 30) {
            respawnPerson(name: "SceneKit", position:  position, withHelp:  withHelp)
            
        } else if ( GameManager.shared.countDown < 30) &&
            (GameManager.shared.countDown >= 15) {
            
            respawnPerson(name: "ARKit", position: position, withHelp:  withHelp)
            
        } else if (GameManager.shared.countDown < 15) &&
            (GameManager.shared.countDown >= 0) {
            respawnPerson(name: "CoreML", position:  position, withHelp:  withHelp)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let characterAPersonB = contact.bodyA.categoryBitMask == CollisionCategoryBitmask.Player && contact.bodyB.categoryBitMask == CollisionCategoryBitmask.peopleWithOutHelp
        
        if characterAPersonB && GameManager.shared.countDown < 59 {
            //score helped person
            if ((contact.bodyB.node?.parent) != nil) {
                GameManager.shared.score += 1
                
                let person  = SKSpriteNode(imageNamed: "GoldenPersonBook")
                person.position = (contact.bodyB.node?.position)!
                person.setScale(1.5)
                gameLayer?.setPersonPhysicsBody(person: person, personWithHelp: true)
                
                if (GameManager.shared.countDown >= 45) {
                    person.name = "SpriteKit"
                    
                } else if (GameManager.shared.countDown < 45) &&
                    (GameManager.shared.countDown >= 30) {
                    person.name = "SceneKit"
                    
                } else if ( GameManager.shared.countDown < 30) &&
                    (GameManager.shared.countDown >= 15) {
                    
                    person.name = "ARKit"
                    
                } else if (GameManager.shared.countDown < 15) &&
                    (GameManager.shared.countDown >= 0) {
                    person.name = "CoreML"
                }
                addChild(person)

                if contact.bodyB.node?.name == "SpriteKit" {
                    GameManager.shared.spriteKit += 1
                } else if contact.bodyB.node?.name == "SceneKit" {
                    GameManager.shared.sceneKit += 1
                } else if contact.bodyB.node?.name == "CoreML" {
                    GameManager.shared.coreMl += 1
                } else if contact.bodyB.node?.name == "ARKit" {
                    GameManager.shared.arKit += 1
                } else {
                    //Nothing to do
                }

                contact.bodyB.node?.removeFromParent()

            }
        }
        
        let enemyAPersonHelpedB = contact.bodyA.categoryBitMask == CollisionCategoryBitmask.enemy && contact.bodyB.categoryBitMask == CollisionCategoryBitmask.peopleWithHelp
        
        if enemyAPersonHelpedB {
            if ((contact.bodyB.node?.parent) != nil) {
                
                GameManager.shared.score -= 1
                
                if contact.bodyB.node?.name == "SpriteKit" {
                    GameManager.shared.spriteKit -= 1
                } else if contact.bodyB.node?.name == "SceneKit" {
                    GameManager.shared.sceneKit -= 1
                } else if contact.bodyB.node?.name == "CoreML" {
                    GameManager.shared.coreMl -= 1
                } else if contact.bodyB.node?.name == "ARKit" {
                    GameManager.shared.arKit -= 1
                } else {
                    //Nothing to do
                }
                
                managePeopleReSpawn(position: (contact.bodyB.node?.position)!, withHelp: false)
                contact.bodyB.node?.removeFromParent()
            }
        }
    }
}
