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

    var initialScene: StartScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

  private func setupView() {

      if let view = self.view as! SKView? {
          // It creates the initial SKScene
          initialScene = StartScene(size: self.view.bounds.size)
          // Set the scale mode to scale to fit the window
          initialScene.scaleMode = .aspectFill
          // Present the scene
          view.presentScene(initialScene)
          view.ignoresSiblingOrder = true
          view.showsFPS = true
          view.showsNodeCount = true
          view.showsPhysics = false
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
