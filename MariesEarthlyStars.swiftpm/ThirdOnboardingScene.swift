//
//  ThirdOnboardingScene.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 18/04/23.
//

import SpriteKit

class ThirdOnboardingScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "game-screen-background")
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -1
        background.size = self.frame.size
        background.aspectFillToSize(self.size)
        self.addChild(background)
        
        let journal = SKSpriteNode(imageNamed: "journal-onboarding")
        journal.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        journal.zPosition = 1
        journal.size = CGSize(width: 800, height: 558.79)
        self.addChild(journal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(withDuration: 1.0)
        let secondOnboardingScene = MenuScene(size: self.size)
        self.view?.presentScene(secondOnboardingScene, transition: transition)
    }
}
