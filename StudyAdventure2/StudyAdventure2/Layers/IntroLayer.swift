//
//  IntroLayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class IntroLayer: SKNode {
    
    //MARK:- Properties
    private var background: SKSpriteNode?
    private var character: SKSpriteNode?
    private var textBalloon: SKSpriteNode?
    private var yesBtn: SKSpriteNode?
    private var noBtn: SKSpriteNode?
    
    //MARK:- Constructor
    init(size: CGSize) {
        super.init()
        setBackgroundUP(size: size)
        setCharacterUp(size: size)
        setTheBalloonUp(size: size)
        setYesButton(size: size)
        setNoButton(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods

    /**
     Function to set the background of the scene
     - parameter size: size of the screen
     */
    private func setBackgroundUP(size: CGSize) {
        background = SKSpriteNode(imageNamed: "IntroScene")
        background?.position = CGPoint(x: size.width/2, y: size.height/2)
        background?.zPosition = -10
        addChild(background!)
    }
    
    /**
     Function that sets the character on the screen
     - parameter size: size of the screen
     */
    private func setCharacterUp(size: CGSize) {
        character = SKSpriteNode(imageNamed: "FrontCharacter")
        character?.position = CGPoint(x: size.width * 0.2, y: size.height * 0.25)
        addChild(character!)
    }
    
    /**
     Function that sets the  balloon
     - parameter size: size of the screen
     */
   private func setTheBalloonUp(size: CGSize) {
        textBalloon = SKSpriteNode(imageNamed: "TalkBaloon")
        textBalloon?.position = CGPoint(x: size.width * 0.4, y: size.height * 0.5)
        textBalloon?.zPosition = 1
        addChild(textBalloon!)
    }
    
    /**
     Function to set up the yes button to the scene
     - parameters: - size: screen size to put the button in the screen
     */
    private func setYesButton(size: CGSize) {
        yesBtn = SKSpriteNode(imageNamed: "YesBtn")
        yesBtn?.position = CGPoint(x: size.width * 0.4, y: size.height * 0.15)
        yesBtn?.name = "yesBtn"
        addChild(yesBtn!)
    }

    /**
     Function to set up the no button to the scene
     - parameters: - size: screen size to put the button in the screen
     */
    private func setNoButton(size: CGSize) {
        noBtn = SKSpriteNode(imageNamed: "NoBtn")
        noBtn?.position = CGPoint(x: size.width * 0.6, y: size.height * 0.15)
        noBtn?.name = "noBtn"
        addChild(noBtn!)
    }
}
