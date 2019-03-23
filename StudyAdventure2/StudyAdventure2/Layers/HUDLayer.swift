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
    var scoreSpriteKit: SKLabelNode?
    var scoreSceneKit: SKLabelNode?
    var scoreArKit: SKLabelNode?
    var scoreCoreML: SKLabelNode?
    
    
    //MARK:- Constructor
    init(size: CGSize) {
        super.init()
        setUpTimeBackground(size: size)
        setUpScoreBackground(size: size)
        setUpTimeLabel(size: size)
        setUpScoreCount(size: size)
        setUpScoreARKit(size: size)
        setUpScoreCoreML(size: size)
        setUpScoreSceneKit(size: size)
        setUpScoreSpriteKit(size: size)
        
        startTimer()
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
        timeBackground?.position = CGPoint(x: size.width * 0.9, y: size.height * 0.9)
        timeBackground?.zPosition = -1
        addChild(timeBackground!)
    }
    
    /**
     Function to set the score background  into the scene
     - parameters: size: size of the screen to position the background into the scene
     */
    private func setUpScoreBackground(size: CGSize) {
        scoreBackground = SKSpriteNode(imageNamed: "RectangleHelped")
        scoreBackground?.position = CGPoint(x: size.width * 0.34, y: size.height * 0.9)
        scoreBackground?.zPosition = -1
        addChild(scoreBackground!)
    }
    
    /**
     Function to set the time score label  into the scene
     - parameters: size: size of the screen to position the label into the scene
     */
    private func setUpScoreLabel(size: CGSize) {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel?.text = "Total score:"
        scoreLabel?.fontColor = UIColor.white
        scoreLabel?.fontSize = 12.0
        scoreLabel?.zPosition = 10
        scoreLabel?.numberOfLines = 3
        scoreLabel?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.85)
        addChild(scoreLabel!)
    }
    
    /**
     Function to set the time score label  into the scene
     - parameters: size: size of the screen to position the label into the scene
     */
    private func setUpScoreSpriteKit(size: CGSize) {
        scoreSpriteKit = SKLabelNode(fontNamed: "Chalkduster")
        scoreSpriteKit?.text = String(GameManager.shared.spriteKit)
        scoreSpriteKit?.fontColor = UIColor.white
        scoreSpriteKit?.fontSize = 12.0
        scoreSpriteKit?.zPosition = 10
        scoreSpriteKit?.numberOfLines = 3
        scoreSpriteKit?.position = CGPoint(x: size.width * 0.27, y: size.height * 0.85)
        addChild(scoreSpriteKit!)
    }
    /**
     Function to set the time score label  into the scene
     - parameters: size: size of the screen to position the label into the scene
     */
    private func setUpScoreSceneKit(size: CGSize) {
        scoreSceneKit = SKLabelNode(fontNamed: "Chalkduster")
        scoreSceneKit?.text = String(GameManager.shared.sceneKit)
        scoreSceneKit?.fontColor = UIColor.white
        scoreSceneKit?.fontSize = 12.0
        scoreSceneKit?.zPosition = 10
        scoreSceneKit?.numberOfLines = 3
        scoreSceneKit?.position = CGPoint(x: size.width * 0.38, y: size.height * 0.85)
        addChild(scoreSceneKit!)
    }
    /**
     Function to set the time score label  into the scene
     - parameters: size: size of the screen to position the label into the scene
     */
    private func setUpScoreARKit(size: CGSize) {
        scoreArKit = SKLabelNode(fontNamed: "Chalkduster")
        scoreArKit?.text = String(GameManager.shared.arKit)
        scoreArKit?.fontColor = UIColor.white
        scoreArKit?.fontSize = 12.0
        scoreArKit?.zPosition = 10
        scoreArKit?.numberOfLines = 3
        scoreArKit?.position = CGPoint(x: size.width * 0.5, y: size.height * 0.85)
        addChild(scoreArKit!)
    }
    
    /**
     Function to set the time score label  into the scene
     - parameters: size: size of the screen to position the label into the scene
     */
    private func setUpScoreCoreML(size: CGSize) {
        scoreCoreML = SKLabelNode(fontNamed: "Chalkduster")
        scoreCoreML?.text = String(GameManager.shared.coreMl)
        scoreCoreML?.fontColor = UIColor.white
        scoreCoreML?.fontSize = 12.0
        scoreCoreML?.zPosition = 10
        scoreCoreML?.numberOfLines = 3
        scoreCoreML?.position = CGPoint(x: size.width * 0.6, y: size.height * 0.85)
        addChild(scoreCoreML!)
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
        timeTxt?.position = CGPoint(x: size.width * 0.9, y: size.height * 0.85)
        addChild(timeTxt!)
    }
    
    func startTimer() {
        let startTimerAction = GameManager.shared.TimerWithActions()
        self.run(startTimerAction)
    }
    
    /**
    function to set up the famework that is going to be taught to other people
     - parameters: name: name of the framework that is supposed to be taught
     size: size of the screen to position the image
     */
    func showTeachFrameWork(name: String, size: CGSize) {
       
        let framework = SKSpriteNode(imageNamed: name)
        framework.position = CGPoint(x: size.width/2 , y: size.height/2)
        framework.zPosition = 20
        addChild(framework)
        
        let waitAction = SKAction.wait(forDuration: 2.5)
        let desappearAction = SKAction.run {
            framework.isHidden = true
            framework.removeFromParent()
        }
        let sequenceAction = SKAction.sequence([waitAction, desappearAction])
        framework.run(sequenceAction)
    }
}
