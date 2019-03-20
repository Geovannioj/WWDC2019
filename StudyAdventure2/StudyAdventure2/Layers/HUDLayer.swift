//
//  HUDLayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 19/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class HUDLayer: SKNode {
    
    //MARK:- Properties
    private var timeBackground: SKSpriteNode?
    private var scoreBackground: SKSpriteNode?
    var scoreLabel: SKLabelNode?
    var scoreResult: SKLabelNode?
    var timeTxt: SKLabelNode?
    
    //MARK:- Constructor
    init(size: CGSize) {
        super.init()
        setUpTimeBackground(size: size)
        setUpScoreBackground(size: size)
        setUpScoreLabel(size: size)
        setUpTimeLabel(size: size)
        setUpScoreCount(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class Methods
    
    /**
     Function to set the time background  into the scene
     - parameters: size: size of the screen to position the background into the scene
     */
    private func setUpTimeBackground(size: CGSize) {
        timeBackground = SKSpriteNode(imageNamed: "RectangleTime")
        timeBackground?.position = CGPoint(x: size.width/2, y: size.height * 0.9)
        timeBackground?.zPosition = -1
        addChild(timeBackground!)
    }
    
    /**
     Function to set the score background  into the scene
     - parameters: size: size of the screen to position the background into the scene
     */
    private func setUpScoreBackground(size: CGSize) {
        scoreBackground = SKSpriteNode(imageNamed: "RectangleHelped")
        scoreBackground?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.9)
        scoreBackground?.zPosition = -1
        addChild(scoreBackground!)
    }
    
    /**
     Function to set the time score label  into the scene
     - parameters: size: size of the screen to position the label into the scene
     */
    private func setUpScoreLabel(size: CGSize) {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel?.text = "Score:"
        scoreLabel?.fontColor = UIColor.white
        scoreLabel?.fontSize = 12.0
        scoreLabel?.zPosition = 10
        scoreLabel?.numberOfLines = 3
        scoreLabel?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.9)
        addChild(scoreLabel!)
    }
    
    /**
     Function to set the time score result label  into the scene
     - parameters: size: size of the screen to position the label into the scene
     */
    private func setUpScoreCount(size: CGSize) {
        scoreResult = SKLabelNode(fontNamed: "Chalkduster")
        scoreResult?.text = "3"
        scoreResult?.fontColor = UIColor.white
        scoreResult?.fontSize = 12.0
        scoreResult?.zPosition = 10
        scoreResult?.numberOfLines = 3
        scoreResult?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.85)
        addChild(scoreResult!)
    }
    
    /**
     Function to set the time time label  into the scene
     - parameters: size: size of the screen to position the label into the scene
     */
    private func setUpTimeLabel(size: CGSize) {
        timeTxt = SKLabelNode(fontNamed: "Chalkduster")
        timeTxt?.text = "Time:\n 40"
        timeTxt?.fontColor = UIColor.white
        timeTxt?.fontSize = 12.0
        timeTxt?.numberOfLines = 2
        timeTxt?.zPosition = 10
        timeTxt?.position = CGPoint(x: size.width/2, y: size.height * 0.85)
        addChild(timeTxt!)
    }
    

}
