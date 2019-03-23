//
//  GameIntro.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 23/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

public class GameIntro: SKScene {
    //MARK:- properties
    
    private var background: SKSpriteNode?
    private var helpNode: SKSpriteNode?
    private var player: SKSpriteNode?
    private var okBtn: SKSpriteNode?
    
    //MARK:- Constructor
    override public init(size: CGSize) {
        super.init(size: size)
        setBackgroundUp(size: size)
        setHelpRequestUp(size: size)
        setUPPlayer(size: size)
        playActionsScene(size: size, carNode: player!)
        setPlayBtn(size: size)
        GameManager.shared.startMusic(musicName: "BackgroundNew_land_cut.mp3", node: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class Method
    
    /**
     Function to change the current scene to the GameScene
     
     */
    public  func changeScene(){
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.removeAllChildren()
        self.view?.presentScene(gameScene, transition: showScene)
    }
    
    public  func setPlayBtn(size: CGSize) {
        okBtn = SKSpriteNode(imageNamed: "OKBtn")
        okBtn?.position = CGPoint(x: size.width * 0.8, y: size.height * 0.1)
        okBtn?.name = "OKBtn"
        addChild(okBtn!)
    }
    
    /**
     Function to set the car scene background up
     - parameters: size: Size of the screen to position the background
     */
    public  func setBackgroundUp(size: CGSize) {
        background = SKSpriteNode(imageNamed: "GameIntro")
        background?.position = CGPoint(x: size.width/2, y: size.height/2)
        background?.zPosition = -10
        addChild(background!)
    }
    /**
     Function to set the player into the scene
     - parameters: size: size of the screen to position the player into the scene
     */
    public  func setUPPlayer(size: CGSize) {
        player = SKSpriteNode(imageNamed: "CharacterBookWalk1")
        player?.position = CGPoint(x: size.width * 0, y: size.height/2)
        player?.zPosition = 2
        player?.setScale(0.2)
        addChild(player!)
    }
    
    /**
     Function to set the car sprite  up
     - parameters: size: Size of the screen to position the car
     */
    public  func setHelpRequestUp(size: CGSize) {
        helpNode = SKSpriteNode(imageNamed: "HelpRequest")
        helpNode?.setScale(0.6)
        helpNode?.position = CGPoint(x: size.width * 0.5, y: size.height * 0.4)
        helpNode?.zPosition = 1
        helpNode?.setScale(1.2)
        helpNode?.isHidden = false
        addChild(helpNode!)
    }
    
    /**
     Function to set the car's action to move through the scene
     - parameters: size: Size of the screen to position the car
     carNode: node do execute the action of moving
     */
    public  func playActionsScene(size: CGSize, carNode: SKSpriteNode) {
        let moveAction = SKAction.moveTo(x: size.width * 0.3, duration: 2.0)
        self.player!.run(moveAction)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            if node.name == "OKBtn" {
                changeScene()
            }
        }
    }
}

