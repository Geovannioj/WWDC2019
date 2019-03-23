//
//  CarScene.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 19/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class CarScene: SKScene {
    
    //MARK:- properties
    
    private var background: SKSpriteNode?
    var carNode: SKSpriteNode?
    
    //MARK:- Constructor
    override init(size: CGSize) {
        super.init(size: size)
        setBackgroundUp(size: size)
        setCarUp(size: size)
        moveCar(size: size, carNode: carNode!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:- Class Method
    
    /**
     Function to change the current scene to the GameScene
     
     */
    private func changeScene(){
        let preGameSceneScene = PreGameScene(size: size)
        preGameSceneScene.scaleMode = scaleMode
        let showScene = SKTransition.fade(withDuration: 0.2)
        self.removeAllChildren()
        self.view?.presentScene(preGameSceneScene, transition: showScene)
    }
    
    /**
     Function to set the car scene background up
     - parameters: size: Size of the screen to position the background
     */
    private func setBackgroundUp(size: CGSize) {
        background = SKSpriteNode(imageNamed: "CarScene")
        background?.position = CGPoint(x: size.width/2, y: size.height/2)
        background?.zPosition = -10
        addChild(background!)
    }
    
    /**
     Function to set the car sprite  up
     - parameters: size: Size of the screen to position the car
     */
    private func setCarUp(size: CGSize) {
        carNode = SKSpriteNode(imageNamed: "Car")
        carNode?.setScale(0.6)
        carNode?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.2)
        carNode?.zPosition = 1
        addChild(carNode!)
    }
    
    /**
     Function to set the car's action to move through the scene
     - parameters: size: Size of the screen to position the car
     carNode: node do execute the action of moving
     */
    private func moveCar(size: CGSize, carNode: SKSpriteNode) {
        let moveAction = SKAction.moveTo(x: size.width, duration: 4.0)
        let changeSceneAction = SKAction.run {
            self.changeScene()
        }
        let sequence = SKAction.sequence([moveAction, changeSceneAction])
        carNode.run(sequence)
    }
}
