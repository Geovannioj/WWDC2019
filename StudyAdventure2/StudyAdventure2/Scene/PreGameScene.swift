//
//  PreGameScene.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 23/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class PreGameScene: SKScene {
    
    private var backgroundImg: SKSpriteNode?
    private var backBtn: SKSpriteNode?
    private var palyBtn: SKSpriteNode?
    
    //MARK:- Constructor
    override init(size: CGSize) {
        super.init(size:size)
        setBackGroudn(size: size)
        setBackBtn(size: size)
        setPlayBtn(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    
    private func setBackGroudn(size: CGSize) {
        backgroundImg = SKSpriteNode(imageNamed: "PreGameScreen")
        backgroundImg?.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundImg?.zPosition = -10
        addChild(backgroundImg!)
    }
    
    private func setPlayBtn(size: CGSize) {
        palyBtn = SKSpriteNode(imageNamed: "PlayBtn")
        palyBtn?.position = CGPoint(x: size.width * 0.8, y: size.height * 0.1)
        palyBtn?.name = "PlayBtn"
        addChild(palyBtn!)
    }
    
    private func setBackBtn(size: CGSize) {
        backBtn = SKSpriteNode(imageNamed: "BackBtn")
        backBtn?.position = CGPoint(x: size.width * 0.12, y: size.height * 0.1)
        backBtn?.name = "Back"
        addChild(backBtn!)
    }
    /**
     Function that does the transition to the second Screen( the talking screen)
     */
    private func goToIntroScene() {
        let introScene = IntroScene(size: size)
        introScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.removeAllChildren()
        self.view?.presentScene(introScene, transition: showScene)
    }
    
    private func goToGameScene() {
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.removeAllChildren()
        self.view?.presentScene(gameScene, transition: showScene)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            if node.name == "PlayBtn" {
                goToGameScene()
            } else if node.name == "Back" {
                goToIntroScene()
                
            }
        }
    }
}