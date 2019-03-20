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
    
    //MARK:- constructor
    override init(size: CGSize) {
        super.init(size:size)
        //physics addition
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        setupGameLayer(size: size)
        setupHudLayer(size: size)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class Methods
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
}
