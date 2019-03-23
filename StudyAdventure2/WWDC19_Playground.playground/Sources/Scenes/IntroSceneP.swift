//
//  IntroScreen.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

public class IntroScene: SKScene {
    
    //MARK:- Properties
    var introLayer: IntroLayer?
    let decisionSentence = 4
    let chanceSceneNumber = 11
    
    //MARK:- Constructor
    override public init(size: CGSize) {
        super.init(size:size)
        
        setupIntroLayer(size: size)
        GameManager.shared.startMusic(musicName: "BackgroundNew_land_cut.mp3", node: self)
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
        let carScene = CarScene(size: size)
        carScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.removeAllChildren()
        self.view?.presentScene(carScene, transition: showScene)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            if node.name == "yesBtn" {
                GameManager.shared.playTapSound(node: self)
                introLayer?.yesAnswer += 1
                introLayer?.sentenceNumber += 1
                introLayer?.changeSentence()
                
            } else if node.name == "noBtn" {
                GameManager.shared.playTapSound(node: self)
                introLayer?.noAnswer += 1
                introLayer?.sentenceNumber += 1
                introLayer?.changeSentence()
                
            } else if node.name == "nextBtn" {
                GameManager.shared.playTapSound(node: self)
                if (introLayer?.sentenceNumber)! < chanceSceneNumber {
                    introLayer?.sentenceNumber += 1
                    introLayer?.changeSentence()
                    
                } else {
                    changeScene()
                }
            } else if node.name == "backBtn" {
                GameManager.shared.playTapSound(node: self)
                if (introLayer?.sentenceNumber)! > 1 {
                    introLayer?.sentenceNumber -= 1
                    introLayer?.changeSentence()
                } else {
                    //Nothing to do
                }
                
            }
            else {
                //Nothing to do
            }
        }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        if introLayer?.sentenceNumber == decisionSentence {
            introLayer?.setNextButtonHidden()
            introLayer?.setDecicionButtonsVisible()
            introLayer?.noAnswer = 0
            introLayer?.yesAnswer = 0
            
        } else if (introLayer?.sentenceNumber)! > decisionSentence ||
            (introLayer?.sentenceNumber)! < decisionSentence &&
            (introLayer?.sentenceNumber)! > 1 {
            
            introLayer?.setNextButtonVisible()
            introLayer?.setDecicionButtonsHiden()
            introLayer?.setBackButtonVisible()
            
        } else if (introLayer?.sentenceNumber)! > 1 {
            introLayer?.setBackButtonVisible()
            
        } else if (introLayer?.sentenceNumber)! == 1 {
            introLayer?.setBackButtonHidden()
            
        } else if (introLayer?.sentenceNumber)! <= decisionSentence {
            introLayer?.noAnswer = 0
            introLayer?.yesAnswer = 0
        }
        
    }
}
