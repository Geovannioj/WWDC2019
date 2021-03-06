//
//  StartScreen.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

public class StartScene: SKScene {
    
    //MARK:- Properties
    
    var startLayer: StartLayer?
    
    //MARK:- Constructor
    override public init(size: CGSize) {
        super.init(size: size)
        
        self.setUpLayer(size: size)
        GameManager.shared.startMusic(musicName: "BackgroundNew_land_cut.mp3", node: self)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- methods
    
    /**
     Function that sets up the layer that is responsable of dealing with the first scene's nodes
     - parameter size: size of the screen
     */
    public func setUpLayer(size: CGSize) {
        startLayer = StartLayer(size: size)
        addChild(startLayer!)
    }
    public func changeScene() {
        let introScene = IntroScene(size: size)
        introScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.removeAllChildren()
        self.view?.presentScene(introScene, transition: showScene)
    }
    //    private func changeScene() {
    //        let gameScene = PreGameScene(size: size)
    //        gameScene.scaleMode = scaleMode
    //        let showScene = SKTransition.fade(withDuration: 0.2)
    //        self.removeAllChildren()
    //        self.view?.presentScene(gameScene, transition: showScene)
    //    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            GameManager.shared.playTapSound(node: self)
            if node.name == "tapToStartBtn" {
                GameManager.shared.playTapSound(node: self)
                changeScene()
            } else {
                //Nothing to do
            }
        }
    }
}
