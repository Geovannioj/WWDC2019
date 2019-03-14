//
//  GameViewController.swift
//  StudyAdventure2
//
//  Created by Geovanni Oliveira de Jesus on 14/03/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

  private func setupView() {
      if let view = self.view as! SKView? {
          // Load the SKScene from 'GameScene.sks'
          if let scene = SKScene(fileNamed: "GameScene") {
          // Set the scale mode to scale to fit the window
          scene.scaleMode = .aspectFill
      
          // Present the scene
          view.presentScene(scene)
          }
      
          view.ignoresSiblingOrder = true
      
          view.showsFPS = true
          view.showsNodeCount = true
    }
  }
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
