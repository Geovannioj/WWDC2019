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
    
    //MARK:- Constructor
    init(size:CGSize) {
        super.init()
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
        
    }
}
