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
    
    
    //MARK:- constructor
    override init(size: CGSize) {
        super.init(size:size)
        //physics addition
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class Methods
    
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
}
