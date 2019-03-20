//
//  HUDLayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 19/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class HUDLayer: SKNode {
    
    //MARK:- Properties
    private var timeBackground: SKSpriteNode?
    private var scoreBackground: SKSpriteNode?
    var scoreTxt: SKLabelNode?
    var timeTxt: SKLabelNode?
    
    //MARK:- Constructor
    init(size: CGSize) {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class Methods
}
