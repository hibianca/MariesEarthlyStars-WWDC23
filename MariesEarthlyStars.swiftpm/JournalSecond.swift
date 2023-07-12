//
//  JournalSecond.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 18/04/23.
//

import SpriteKit

class JournalSecond: SKScene {
    
    var menuButton: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        let menuButtonWidth: CGFloat = 57.23
        let menuButtonHeight: CGFloat = 50.09
        let safeArea = view.safeAreaLayoutGuide
        
        menuButton = SKSpriteNode(imageNamed: "menu")
        menuButton.name = "menuButton"
        menuButton.position = CGPoint(x: safeArea.layoutFrame.maxX - 50 - menuButton.size.width / 2,
                                           y: safeArea.layoutFrame.maxY - 50 - menuButton.size.height / 2)
        menuButton.zPosition = 1
        menuButton.aspectFillToSize(self.size)
        menuButton.size = CGSize(width: menuButtonWidth, height: menuButtonHeight)
        
        addChild(menuButton)
        
//        menuButton = SKSpriteNode(imageNamed: "menuButton")
//        menuButton.position = CGPoint(x: size.width/2, y: size.height/4.5)
//        menuButton.zPosition = 1
//
//        addChild(menuButton)
        
        let background = SKSpriteNode(imageNamed: "journal-7")
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -1
        background.size = self.frame.size
        background.aspectFillToSize(self.size)
        self.addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if menuButton.contains(location) {
            goMenu()
        }
    }
    
    func goMenu() {
        guard let view = view else { return }
        let journalSecond = MenuSceneFinal(size: view.bounds.size)
        journalSecond.scaleMode = .aspectFill
        view.presentScene(journalSecond)
    }
}
