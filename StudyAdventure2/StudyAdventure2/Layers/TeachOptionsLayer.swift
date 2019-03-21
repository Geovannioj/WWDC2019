//
//  TeachOptionsLayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 20/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class TeachOptionsLayer: SKNode {
    
    //MARK:- Properties
    var teachOptionbackground: SKSpriteNode?
    var spriteKitOption: SKSpriteNode?
    var sceneKitOption: SKSpriteNode?
    var coreMLOption: SKSpriteNode?
    var arKitOption: SKSpriteNode?
    
    //MARK:- Constructor
    init(size: CGSize) {
        super.init()
        setBackgroundScreen(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods
    
    private func setBackgroundScreen(size: CGSize) {
        teachOptionbackground = SKSpriteNode(imageNamed: "TeachScreen")
        teachOptionbackground?.position = CGPoint(x: size.width/2, y: size.height/2)
        teachOptionbackground?.name = "teachOptionsBackground"
        addChild(teachOptionbackground!)
    }
    
    private func setSpriteKitOption(size: CGSize) {
        spriteKitOption = SKSpriteNode(imageNamed: "")
        spriteKitOption?.position = CGPoint(x: size.width * 0.7, y: size.height/2)
        spriteKitOption?.name = "spriteKit"
    }

}
