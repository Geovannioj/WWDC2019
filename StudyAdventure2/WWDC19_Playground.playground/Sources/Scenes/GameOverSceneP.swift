//
//  GameOverScene.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

public class GameOverScene: SKScene {
    
    //MARK:- Properties
    var gameOverLayer: GameOverLayer?
    
    //MARK:- Constructor
    override public init(size: CGSize) {
        super.init(size:size)
        setGameOverlayer(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    /**
     function to instantiate the gameover layer
     */
    
    public  func setGameOverlayer(size: CGSize) {
        gameOverLayer = GameOverLayer(size: size)
        addChild(gameOverLayer!)
    }
    /**
     Function that does the transition to the second Screen( the talking screen)
     */
    public  func goToStartScene() {
        let startScene = StartScene(size:self.size)
        startScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.view?.presentScene(startScene, transition: showScene)
        self.removeFromParent()
    }
    
    /**
     Function that does the transition to the GameScene
     */
    public  func playAgainScene() {
        let playScene = GameScene(size:self.size)
        playScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.view?.presentScene(playScene, transition: showScene)
        self.removeFromParent()
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            if node.name == "playAgain" {
                GameManager.shared.playTapSound(node: self)
                playAgainScene()
            } else if node.name == "restartEverything" {
                GameManager.shared.playTapSound(node: self)
                goToStartScene()
                
            }
        }
    }
}
