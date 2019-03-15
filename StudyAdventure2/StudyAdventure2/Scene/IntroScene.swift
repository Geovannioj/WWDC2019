//
//  IntroScreen.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class IntroScene: SKScene {
    
    //MARK:- Properties
    private var introLayer: IntroLayer?
    
    //MARK:- Constructor
    override init(size: CGSize) {
        super.init(size:size)
        
        setupIntroLayer(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class Methods
    
    private func setupIntroLayer(size: CGSize) {
        introLayer = IntroLayer(size: size)
        addChild(introLayer!)
    }
    
    private func changeScene() {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            if node.name == "yesBtn" {
                
            } else if node.name == "noBtn" {
                
            } else {
                //Nothing to do
            }
        }
    }
}
