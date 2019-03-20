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
    
    var lastTouchLocation: CGPoint?
    
    //MARK:- constructor
    override init(size: CGSize) {
        super.init(size:size)
        
        //physics addition
        setupGameLayer(size: size)
        setupHudLayer(size: size)
    
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
    override func update(_ currentTime: TimeInterval) {
        gameLayer!.updateTimeVariation(currentTime: currentTime)
        gameLayer!.moveCharacter(sprite: gameLayer!.player!,
                                 velocity: gameLayer!.velocity)
        
        movimentationFunction()
        gameLayer!.checkBounds(size: size)
        hudLayer!.timeTxt!.text = String(GameManager.shared.countDown)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
}
