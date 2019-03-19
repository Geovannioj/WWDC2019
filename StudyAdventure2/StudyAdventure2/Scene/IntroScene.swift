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
    private let decisionSentence = 4
    
    //MARK:- Constructor
    override init(size: CGSize) {
        super.init(size:size)
        
        setupIntroLayer(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class Methods

    /**
     Function to setup the intro layer to the intro scene
     - parameters: size: size of the screen
     */
    private func setupIntroLayer(size: CGSize) {
        introLayer = IntroLayer(size: size)
        addChild(introLayer!)
    }
    
    /**
     Function to change the Intro scene to the Game Scene
     */
    private func changeScene() {
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.removeAllChildren()
        self.view?.presentScene(gameScene, transition: showScene)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            if node.name == "yesBtn" {
                introLayer?.yesAnswer += 1
                introLayer?.sentenceNumber += 1
                introLayer?.changeSentence()
            
            } else if node.name == "noBtn" {
                introLayer?.noAnswer += 1
                introLayer?.sentenceNumber += 1
                introLayer?.changeSentence()
                
            } else if node.name == "nextBtn" {
                if (introLayer?.sentenceNumber)! < 12 {
                    introLayer?.sentenceNumber += 1
                    introLayer?.changeSentence()
                } else {
                    changeScene()
                }
            } else {
                //Nothing to do
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if introLayer?.sentenceNumber == decisionSentence {
            introLayer?.setNextButtonHidden()
            introLayer?.setDecicionButtonsVisible()
        } else if (introLayer?.sentenceNumber)! > decisionSentence {
            introLayer?.setNextButtonVisible()
            introLayer?.setDecicionButtonsHiden()
        }
    }
}
