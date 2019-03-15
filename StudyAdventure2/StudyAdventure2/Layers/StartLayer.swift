//
//  StartScreenLayer.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

enum studentType {
    case femaleStudent
    case maleStudent
}

class StartLayer: SKNode {
    
    //MARK:- Properties
    private var background: SKSpriteNode!
    private var tapToStart: SKSpriteNode!
    private var title: SKSpriteNode!
    private var secondaireTitle: SKSpriteNode!
    private var character: SKSpriteNode!
    private var clouds = [SKSpriteNode]()
    private var books = [SKSpriteNode]()
    private var students = [SKSpriteNode]()
    
    //MARK:- Constructor
    init(size: CGSize) {
        super.init()
        
        setupScene(size: size)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods
    
    /**
     Function to set up all the components of the start scene layer
     - parameters:- size: screen size
     */
    private func setupScene(size: CGSize) {
        setUpbackgroundImg(size: size)
        setupTitle(size: size)
        setTapToStartButton(size: size)
        setCharacher(size: size)
        setUpClouds(size: size)
        setStudentsUp(size: size)
        setBooks(size: size)
        animateTapBtn()
    }
    /**
     Function that sets up the background image of the main layer
     - parameter size: size of the screen
     */
    func setUpbackgroundImg(size: CGSize) {
        background = SKSpriteNode(imageNamed:"Background")
        background.position = CGPoint(x:size.width/2, y:size.height/2)
        background.zPosition = -10
        addChild(background)
    }
    
    /**
     Function to setUp the character in the first screen
     - parameters: -size: size of the screen
     */
    private func setCharacher(size:CGSize) {
        character = SKSpriteNode(imageNamed: "CharacterBook")
        character.position = CGPoint(x: size.width * 0.16, y: size.height * 0.4)
        character.setScale(0.5)
        character.zPosition = 6
        addChild(character)
    }
    
    /**
     Function to set up the tap to start button in the start layer
     - parameters:- size: size of the screen
     */
    private func setTapToStartButton (size: CGSize) {
        tapToStart = SKSpriteNode(imageNamed: "StartBtn")
        tapToStart.position = CGPoint(x: size.width * 0.5, y: size.height * 0.16)
        tapToStart.zPosition = 10
        tapToStart.name = "tapToStartBtn"
        addChild(tapToStart)
    }
    
    /**
     Function to setup the title and the secondary title in the start screen
     - parameters:- size: size of the screen
     */
    private func setupTitle(size: CGSize) {
        title = SKSpriteNode(imageNamed: "Title")
        title.position = CGPoint(x: size.width / 2, y: size.height * 0.82)
        title.zPosition = 2
        addChild(title)
        
        secondaireTitle = SKSpriteNode(imageNamed: "SecondaireTitle")
        secondaireTitle.position = CGPoint(x: size.width/2, y: size.height * 0.65)
        secondaireTitle.zPosition = 1
        addChild(secondaireTitle)
    }
    
    /**
     Function that makes the tap button scale animation
     */
    func animateTapBtn() {
        let scaleAction = SKAction.scale(by: 1.1, duration: 1.0)
        let sequence = SKAction.sequence([scaleAction, scaleAction.reversed()])
        let repeatSequence = SKAction.repeatForever(sequence)
        tapToStart.run(repeatSequence)
    }
    
    /**
     Function to setUp all the students in the first layer
     - parameters: size: size of the screen
     */
    
    private func setStudentsUp(size: CGSize) {
        //Rotation angle
        //note: 10 degrees in ratians = 0,174533
        let rotationAngle = Float(0.1)
        //Time to do the rotateAction
        let timeToRotate = 3.0
        //Student amount
        let amountOfStudents = 10
        
        for index in 0..<amountOfStudents {
            
            switch index {
            case 0:
                setStudentSprite(gender: .femaleStudent,
                                 xProportion: CGFloat(0.5),
                                 yProportion: CGFloat(0.4),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
                
                break
            case 1:
             
                setStudentSprite(gender: .maleStudent,
                                 xProportion: CGFloat(0.6),
                                 yProportion: CGFloat(0.35),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
                break
            case 2:

                setStudentSprite(gender: .femaleStudent,
                                 xProportion: CGFloat(0.4),
                                 yProportion: CGFloat(0.38),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
                break
            case 3:
                setStudentSprite(gender: .maleStudent,
                                 xProportion: CGFloat(0.45),
                                 yProportion: CGFloat(0.3),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
                break
            case 4:
                setStudentSprite(gender: .femaleStudent,
                                 xProportion: CGFloat(0.55),
                                 yProportion: CGFloat(0.3),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
                break
            case 5:
                setStudentSprite(gender: .maleStudent,
                                 xProportion: CGFloat(0.65),
                                 yProportion: CGFloat(0.25),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
                break
            case 6:
                setStudentSprite(gender: .femaleStudent,
                                 xProportion: CGFloat(0.7),
                                 yProportion: CGFloat(0.3),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
            case 7:
                setStudentSprite(gender: .maleStudent,
                                 xProportion: CGFloat(0.8),
                                 yProportion: CGFloat(0.35),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
            case 8:
                setStudentSprite(gender: .femaleStudent,
                                 xProportion: CGFloat(0.8),
                                 yProportion: CGFloat(0.2),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
            case 9:
                setStudentSprite(gender: .femaleStudent,
                                 xProportion: CGFloat(0.85),
                                 yProportion: CGFloat(0.35),
                                 rotationAngle: rotationAngle,
                                 timeToRotate: timeToRotate,
                                 index: index,
                                 size: size)
            default:
                break
                
            }
        }
    }
    
    /**
     Function that sets up the clounds in the firstScreen
     - parameter size: size of the screen
     */
    func setUpClouds(size: CGSize) {
        
        var action: SKAction!
        let amountOfClounds = 4
        
        for index in 0..<amountOfClounds {
            let cloud = SKSpriteNode(imageNamed: "Cloud")
            switch index {
            case 0 :
                cloud.position = CGPoint(x: size.width * 0.1, y: size.height * 0.9)
                action = SKAction.move(to: CGPoint(x: size.width * 0.4, y: size.height * 0.9), duration: 100.0)
                break
            case 1:
                cloud.position = CGPoint(x: size.width * 0.4, y: size.height * 0.9)
                action = SKAction.move(to: CGPoint(x: size.width * 0.1, y: size.height * 0.9), duration: 100.0)
                break
                
            case 2:
                cloud.position = CGPoint(x: size.width * 0.6, y: size.height * 0.9)
                action = SKAction.move(to: CGPoint(x: size.width * 0.8, y: size.height * 0.9), duration: 100.0)
                break
                
            case 3:
                cloud.position = CGPoint(x: size.width * 0.9, y: size.height * 0.9)
                action = SKAction.move(to: CGPoint(x: size.width * 0.7, y: size.height * 0.9), duration: 100.0)
                break
                
            default:
                
                break
                
            }
            cloud.run(action)
            clouds.append(cloud)
            addChild(clouds[index])
        }
    }
    
    /**
     Function to put the books and position them on the screen
     - parameters: size - size of the screen to position the books
     */
    private func setBooks(size: CGSize) {
        let amountOfBooks = 5
        
        
        for index in 0..<amountOfBooks {
            let book = SKSpriteNode(imageNamed: "Book")
            book.zPosition = 4
            
            switch index {
            case 0:
                book.position = CGPoint(x: size.width * 0.05, y: size.height * 0.2)
                break
            case 1:
                book.position = CGPoint(x: size.width * 0.1, y: size.height * 0.3)
                break
            case 2:
                book.position = CGPoint(x: size.width * 0.15, y: size.height * 0.1)
                break
            case 3:
                book.position = CGPoint(x: size.width * 0.2, y: size.height * 0.15)
                break
            case 4:
                book.position = CGPoint(x: size.width * 0.25, y: size.height * 0.1)
                break
            case 5:
                book.position = CGPoint(x: size.width * 0.23, y: size.height * 0.15)
                break
            default:
                break
            }
            addChild(book)
        }
    }
    
    /**
     Function that puts the students into the screens and adds it's rotation method to the objects.
     - parameters: gender - student gender male or female
     xProportion: value between 0 and 1 to show the percentage of the screen to Xposition
     yProportion: value between 0 and 1 to show the percentage of the screen to yposition
     rotationAngle: angle fo rotate the students
     timeToRotate: Time to the action of rotating the student to be done
     index: index of the student to the added in the array
     size: Screen size to position the objects
     */
    private func setStudentSprite(gender: studentType,
                                  xProportion: CGFloat,
                                  yProportion: CGFloat,
                                  rotationAngle: Float,
                                  timeToRotate: TimeInterval,
                                  index: Int,
                                  size: CGSize){
        
        var studentSprite: SKSpriteNode
        
        //Instanciate the right gender of the student
        if gender == .femaleStudent {
            studentSprite = SKSpriteNode(imageNamed: "Girl")
        } else {
            studentSprite = SKSpriteNode(imageNamed: "Boy")
        }
        
        //Position
        studentSprite.position = CGPoint(x: size.width * xProportion,
                                         y: size.height * yProportion)
        //Adds the rotation Action
        rotateSprite(sprite: studentSprite,
                     angle: rotationAngle,
                     time: timeToRotate)
        //Add the student to the array of students
        self.students.append(studentSprite)
        //Add the student to the layer
        addChild(students[index])
    }
    
    /**
     Function to constantly rotate a note to a certain angle in a certain time
     - parameters:
     sprite: Node to execute the rotation action
     angle: angle to be rotated to
     time: time to execute the rotation
     */
    private func rotateSprite(sprite: SKSpriteNode,
                              angle: Float,
                              time: TimeInterval) {
        
        //Rotation actions
        let action = SKAction.rotate(toAngle: CGFloat(angle), duration: time)
        let reverseAction = SKAction.rotate(toAngle: CGFloat(-angle), duration: time)
        let actionsComposed = SKAction.sequence([action,reverseAction])
        let repeatRotation = SKAction.repeatForever(actionsComposed)
        
        sprite.run(repeatRotation)
    }
}
