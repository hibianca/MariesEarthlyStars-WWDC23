//
//  Onboarding.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 16/04/23.
//

import SpriteKit

class OnboardingScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "game-screen-background")
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -1
        background.size = self.frame.size
        background.aspectFillToSize(self.size)
        self.addChild(background)
        
        let icon = SKSpriteNode(imageNamed: "icon-horizontal")
        icon.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        icon.zPosition = 1
        self.addChild(icon)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(withDuration: 1.0)
        let onboardingScene = SecondOnboardingScene(size: self.size)
        self.view?.presentScene(onboardingScene, transition: transition)
    }
}
