//
//  IntroLayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

public class IntroLayer: SKNode {
    
    //MARK:- Properties
    private var background: SKSpriteNode?
    private var character: SKSpriteNode?
    private var textBalloon: SKSpriteNode?
    private var yesBtn: SKSpriteNode?
    private var noBtn: SKSpriteNode?
    private var nextBtn: SKSpriteNode?
    private var backBtn: SKSpriteNode?
    private var textNode: SKLabelNode?
    
    var sentenceNumber: Int = 1
    var noAnswer: Int = 0
    var yesAnswer: Int = 0
    
    //MARK:- Constructor
    public init(size: CGSize) {
        super.init()
        setLayer(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods
    
    /**
     Function to set all the elements in the scene
     - parameters: - size: screen size
     */
    
    private func setLayer(size: CGSize) {
        setBackgroundUP(size: size)
        setCharacterUp(size: size)
        setTheBalloonUp(size: size)
        setYesButton(size: size)
        setNoButton(size: size)
        setNextBtn(size: size)
        setBackBtn(size: size)
        setTextToTheBalloon()
    }
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
        character?.position = CGPoint(x: size.width * 0.2, y: size.height * 0.3)
        addChild(character!)
    }
    
    /**
     Function that sets the  balloon
     - parameter size: size of the screen
     */
    private func setTheBalloonUp(size: CGSize) {
        textBalloon = SKSpriteNode(imageNamed: "TalkBaloon")
        textBalloon?.position = CGPoint(x: size.width * 0.4, y: size.height * 0.6)
        textBalloon?.zPosition = 1
        textBalloon?.setScale(CGFloat(1.2))
        addChild(textBalloon!)
    }
    
    /**
     Function to set up the yes button to the scene
     - parameters: - size: screen size to put the button in the screen
     */
    private func setYesButton(size: CGSize) {
        yesBtn = SKSpriteNode(imageNamed: "YesBtn")
        yesBtn?.position = CGPoint(x: size.width * 0.6, y: size.height * 0.15)
        yesBtn?.name = "yesBtn"
        yesBtn?.isHidden = true
        addChild(yesBtn!)
    }
    
    /**
     Function to set up the no button to the scene
     - parameters: - size: screen size to put the button in the screen
     */
    private func setNoButton(size: CGSize) {
        noBtn = SKSpriteNode(imageNamed: "NoBtn")
        noBtn?.position = CGPoint(x: size.width * 0.4, y: size.height * 0.15)
        noBtn?.name = "noBtn"
        noBtn?.isHidden = true
        addChild(noBtn!)
    }
    
    private func setNextBtn(size: CGSize) {
        nextBtn = SKSpriteNode(imageNamed: "NextBtn")
        nextBtn?.position = CGPoint(x: size.width * 0.8, y: size.height * 0.1)
        nextBtn?.name = "nextBtn"
        nextBtn?.isHidden = false
        addChild(nextBtn!)
    }
    
    private func setBackBtn(size: CGSize) {
        backBtn = SKSpriteNode(imageNamed: "BackBtn")
        backBtn?.position = CGPoint(x: size.width * 0.15, y: size.height * 0.1)
        backBtn?.name = "backBtn"
        backBtn?.isHidden = true
        addChild(backBtn!)
    }
    
    /**
     Function that sets the  balloon's text
     */
    private func setTextToTheBalloon() {
        textNode = SKLabelNode(fontNamed: "Chalkduster")
        textNode?.text = "Hello there! Let's have a talk\ntap the button on the screen\n I need to tell you something!"
        textNode?.horizontalAlignmentMode = .center
        textNode?.fontColor = UIColor.black
        textNode?.fontSize = 12.0
        textNode?.zPosition = 10
        textNode?.numberOfLines = 3
        textBalloon!.addChild(textNode!)
    }
    
    /**
     Function to set the decision buttons visible
     */
    func setDecicionButtonsVisible() {
        
        let appearAction = SKAction.run {
            self.noBtn?.isHidden = false
            self.yesBtn?.isHidden = false
        }
        let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
        let sequenceAction = SKAction.sequence([fadeInAction, appearAction])
        
        self.run(sequenceAction)
    }
    
    /**
     Function to set the decision buttons hidden
     */
    public func setDecicionButtonsHiden() {
        
        let appearAction = SKAction.run {
            self.noBtn?.isHidden = true
            self.yesBtn?.isHidden = true
        }
        let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
        let sequenceAction = SKAction.sequence([fadeInAction, appearAction])
        
        self.run(sequenceAction)
    }
    
    /**
     Function to set the next button visible
     */
    public func setNextButtonVisible() {
        
        let appearAction = SKAction.run {
            self.nextBtn?.isHidden = false
        }
        let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
        let sequenceAction = SKAction.sequence([fadeInAction, appearAction])
        
        self.run(sequenceAction)
    }
    
    /**
     Func to set the backButton visible
     */
    public func setBackButtonVisible() {
        let appearAction = SKAction.run {
            self.backBtn?.isHidden = false
        }
        let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
        let sequenceAction = SKAction.sequence([fadeInAction, appearAction])
        
        self.run(sequenceAction)
    }
    
    /**
     Function to set the next button visible
     */
    public func setBackButtonHidden() {
        
        let appearAction = SKAction.run {
            self.backBtn?.isHidden = true
        }
        let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
        let sequenceAction = SKAction.sequence([fadeInAction, appearAction])
        
        self.run(sequenceAction)
    }
    
    /**
     Function to set the next button visible
     */
    public func setNextButtonHidden() {
        
        let appearAction = SKAction.run {
            self.nextBtn?.isHidden = true
        }
        let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
        let sequenceAction = SKAction.sequence([fadeInAction, appearAction])
        
        self.run(sequenceAction)
    }
    /**
     Function responsable of changing the sentences of the talking.
     */
    public func changeSentence() {
        //actions
        let changeTxtAction = SKAction.fadeOut(withDuration: 0.1)
        let fadeInAction = SKAction.fadeIn(withDuration: 0.1)
        
        //actions to change the texts
        
        
        let sentence1Block = SKAction.run {
            self.textNode?.text = "Hello there! Let's have a talk\ntap the button on the screen\n I need to tell you something!"
        }
        
        let sentence2Block = SKAction.run {
            self.textNode?.text = "Last year I got a lot of help \n and I became an iOS Developer!"
        }
        let sentence3Block = SKAction.run {
            
            self.textNode?.text = "Now I want to share my knowledge\n and help others like me."
        }
        let sentence4Block = SKAction.run {
            
            self.textNode?.text = "What do you think about?\nDo you like sharing what\n you know with others?"
        }
        //Yes- the person likes to share knowledge
        let sentence5Block = SKAction.run {
            
            self.textNode?.text = "Nice! So do I. Knowledge sharing\n is a good action for you\n and for other people."
        }
        //Yes flow
        let sentence7Block = SKAction.run {
            
            self.textNode?.text = "You learn more when teaching\n others and you help\n another pearson. "
        }
        let sentence8Block = SKAction.run {
            
            self.textNode?.text = "You can improve someone's life\n with knowledge and it must be\n spread as much as possible."
        }
        
        //NO - the person doesn't like to share knowledge
        let sentence6Block = SKAction.run {
            
            self.textNode?.text = "That's a pitty. While teaching other\n people you learn much more and\n you help other people."
        }
        //NO flow
        
        let sentence10Block = SKAction.run {
            
            self.textNode?.text = "We must help others, it is\n a good action to be done."
        }
        let sentence11Block = SKAction.run {
            
            self.textNode?.text = "So what about share your\n knowledge teaching\n others?."
        }
        //MustBeGeneralSentence
        let sentence9Block = SKAction.run {
            
            self.textNode?.text = "Let's teach other people\n iOS Development and change other\n people's lives to a beter way!"
        }
        let sentence12Block = SKAction.run {
            self.textNode?.text = "Guide me through the crowd and\n get to the people who wants\n to learn how to build amazing apps."
        }
        let sentence14Block = SKAction.run {
            self.textNode?.text = "Let's go!"
        }
        
        switch sentenceNumber {
            
        case 1:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence1Block,
                                              fadeInAction])
            self.textNode?.run(sequence)
        case 2:
            
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence2Block,
                                              fadeInAction])
            self.textNode?.run(sequence)
            
            break
            
        case 3:
            
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence3Block,
                                              fadeInAction])
            self.textNode?.run(sequence)
            
            break
            
        case 4:
            
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence4Block,
                                              fadeInAction])
            self.textNode?.run(sequence)
            
            break
            
        case 5:
            var sequence = SKAction()
            //Answer is NO
            if noAnswer == 1 {
                sequence = SKAction.sequence([changeTxtAction,
                                              sentence6Block,
                                              fadeInAction])
                //answer is YES
            } else if yesAnswer == 1 {
                sequence = SKAction.sequence([changeTxtAction,
                                              sentence5Block,
                                              fadeInAction])
            }
            
            self.textNode?.run(sequence)
            break
        case 6:
            var sequence = SKAction()
            //Answer is NO
            if noAnswer == 1 {
                sequence = SKAction.sequence([changeTxtAction,
                                              sentence10Block,
                                              fadeInAction])
                //answer is YES
            } else if yesAnswer == 1 {
                sequence = SKAction.sequence([changeTxtAction,
                                              sentence7Block,
                                              fadeInAction])
            }
            
            self.textNode?.run(sequence)
            break
            
        case 7:
            var sequence = SKAction()
            //Answer is NO
            if noAnswer == 1 {
                sequence = SKAction.sequence([changeTxtAction,
                                              sentence11Block,
                                              fadeInAction])
                //answer is YES
            } else if yesAnswer == 1 {
                sequence = SKAction.sequence([changeTxtAction,
                                              sentence8Block,
                                              fadeInAction])
            }
            self.textNode?.run(sequence)
            break
        case 8:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence9Block,
                                              fadeInAction])
            self.textNode?.run(sequence)
            break
        case 9:
            //Stopped here
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence12Block,
                                              fadeInAction])
            self.textNode?.run(sequence)
            break
        case 10:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence11Block,
                                              fadeInAction])
            self.textNode?.run(sequence)
            break
        case 11:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence14Block,
                                              fadeInAction])
            self.textNode?.run(sequence)
            break
        default: break
            
        }
    }
}
