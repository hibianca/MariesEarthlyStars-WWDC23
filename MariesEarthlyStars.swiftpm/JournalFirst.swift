//
//  JournalFirst.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 18/04/23.
//

import SpriteKit

class JournalFirst: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "journalFirst")
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -1
        background.size = self.frame.size
        background.aspectFillToSize(self.size)
        self.addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(withDuration: 1.0)
        let journalFirst = JournalSecond(size: self.size)
        self.view?.presentScene(journalFirst, transition: transition)
    }
}
