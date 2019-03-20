//
//  CarLayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 19/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class CarLayer: SKNode {
    
    //MARK:- properties
    private var background: SKSpriteNode?
    var carNode: SKSpriteNode?
    
    //MARK:- Constructor
    init(size: CGSize) {
        super.init()
        setBackgroundUp(size: size)
        setCarUp(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class Methods
    
    /**
     Function to set the car scene background up
     - parameters: size: Size of the screen to position the car
     */
    private func setBackgroundUp(size: CGSize) {
        background = SKSpriteNode(imageNamed: "CarScene")
        background?.position = CGPoint(x: size.width/2, y: size.height/2)
        background?.zPosition = -10
        addChild(background!)
    }
    
    private func setCarUp(size: CGSize) {
        carNode = SKSpriteNode(imageNamed: "Car")
        carNode?.setScale(0.6)
        carNode?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.2)
        carNode?.zPosition = 1
        addChild(carNode!)
    }
}
