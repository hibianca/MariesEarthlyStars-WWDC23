//
//  MenuSceneFinal.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 18/04/23.
//

import SpriteKit

class MenuSceneFinal: SKScene {
        
    var startButton: SKSpriteNode!
    var journalButton: SKSpriteNode!
    var creditsButton: SKSpriteNode!
    
    var startButtonSize = CGSize(width: 144, height: 101)
    var journalButtonSize = CGSize(width: 213, height: 107)
    var creditsButtonSize = CGSize(width: 129, height: 59)
    
    let customYellow = SKColor(red: 1.0, green: 0.76, blue: 0.24, alpha: 1.0)
    
    override func didMove(to view: SKView) {
                
        startButton = SKSpriteNode(imageNamed: "playButton")
        //startButton.fillColor = customYellow
        startButton.position = CGPoint(x: size.width/2, y: size.height/3)
        startButton.zPosition = 1 // pra aparecer na frente das outras nodes
        startButton.size = startButtonSize
        addChild(startButton)
        
        journalButton = SKSpriteNode(imageNamed: "journalButton")
        //onboardingButton.fillColor = customYellow
        journalButton.position = CGPoint(x: size.width/2, y: size.height/5.5)
        journalButton.zPosition = 1
        journalButton.size = journalButtonSize
        addChild(journalButton)
        
        creditsButton = SKSpriteNode(imageNamed: "credits-button")
        creditsButton.position = CGPoint(x: size.width/2, y: size.height/15)
        creditsButton.zPosition = 1
        creditsButton.size = creditsButtonSize
        addChild(creditsButton)
                
        addBackground()
        
        func addBackground() {
            let background = SKSpriteNode(imageNamed: "menu-screen-final")
            background.position = CGPoint(x: frame.midX, y: frame.midY)
            background.zPosition = -1 // pra aparecer atrás das outras nodes
            background.size = self.frame.size
            background.aspectFillToSize(self.size)
            
            addChild(background)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if startButton.contains(location) {
            startGame()
        }
        
        if journalButton.contains(location) {
            startJournal()
        }
        
        if creditsButton.contains(location) {
            startCredits()
        }
    }
    
    func startGame() {
        guard let view = view else { return }
        let gameScene = GameScene(size: view.bounds.size)
        gameScene.scaleMode = .aspectFill
        view.presentScene(gameScene)
    }
    
    func startJournal() {
        guard let view = view else { return }
        let journalScene = ThirdOnboardingScene(size: view.bounds.size)
        journalScene.scaleMode = .aspectFill
        view.presentScene(journalScene)
    }
    
    func startCredits() {
        guard let view = view else { return }
        let creditsScene = CreditsScene(size: view.bounds.size)
        creditsScene.scaleMode = .aspectFill
        view.presentScene(creditsScene)
    }
}
