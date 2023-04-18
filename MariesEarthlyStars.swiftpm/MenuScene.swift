//
//  MenuScene.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 14/04/23.
//

import SpriteKit

class MenuScene: SKScene {
        
    var startButton: SKSpriteNode!
    var onboardingButton: SKSpriteNode!
    
    let customYellow = SKColor(red: 1.0, green: 0.76, blue: 0.24, alpha: 1.0)
    
    override func didMove(to view: SKView) {
                
        startButton = SKSpriteNode(imageNamed: "playButton")
        //startButton.fillColor = customYellow
        startButton.position = CGPoint(x: size.width/2, y: size.height/3)
        startButton.zPosition = 1 // pra aparecer na frente das outras nodes
        
        onboardingButton = SKSpriteNode(imageNamed: "journalButton")
        //onboardingButton.fillColor = customYellow
        onboardingButton.position = CGPoint(x: size.width/2, y: size.height/6.5)
        onboardingButton.zPosition = 1
        
//        let playLabel = SKLabelNode(text: "Play")
//        playLabel.fontName = "feeling_passionate"
//        playLabel.fontSize = 64
//        playLabel.fontColor = SKColor.white
//        playLabel.position = CGPoint(x: 0, y: -20)
//        startButton.addChild(playLabel)
        
        addChild(startButton)
        
//        let onboardingLabel = SKLabelNode(text: "Again")
//        onboardingLabel.fontName = "feeling_passionate"
//        onboardingLabel.fontSize = 64
//        onboardingLabel.fontColor = SKColor.white
//        onboardingLabel.position = CGPoint(x: 0, y: -20)
//        onboardingButton.addChild(onboardingLabel)
        
        addChild(onboardingButton)
        
        addBackground()
        
        func addBackground() {
            let background = SKSpriteNode(imageNamed: "menu-screen")
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
        
        if onboardingButton.contains(location) {
            startOnboarding()
        }
    }
    
    func startGame() {
        guard let view = view else { return }
        let gameScene = GameScene(size: view.bounds.size)
        gameScene.scaleMode = .aspectFill
        view.presentScene(gameScene)
    }
    
    func startOnboarding() {
        guard let view = view else { return }
        let onboardingScene = ThirdOnboardingScene(size: view.bounds.size)
        onboardingScene.scaleMode = .aspectFill
        view.presentScene(onboardingScene)
    }
    
}

extension SKSpriteNode {
    func aspectFillToSize(_ size: CGSize) {
        if texture != nil {
            self.size = texture!.size()
            let verticalRatio = size.height / texture!.size().height
            let horizontalRatio = size.width / texture!.size().width
            let scaleRatio = max(horizontalRatio, verticalRatio)
            self.setScale(scaleRatio)
        }
    }
}
