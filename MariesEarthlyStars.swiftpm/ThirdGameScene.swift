//
//  ThirdGameScene.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 15/04/23.
//

import SpriteKit

class ThirdGameScene: SKScene {
    
    var menuButton: SKSpriteNode!
    
    var erlenPechblenda: SKSpriteNode!
    var martelo: SKSpriteNode?
    var mangueira: SKSpriteNode?
    var petri: SKSpriteNode?
    var pote: SKSpriteNode?
    var dropper: SKSpriteNode?
    var journal: SKSpriteNode?
    var iconJournal: SKSpriteNode?
    var retangulo: SKSpriteNode?
    
    var touchPlayer: Bool = false
    var touchPlayer2: Bool = false
    var touchPlayer3: Bool = false
    var touchPlayer4: Bool = false
    var touchPlayer5: Bool = false
    
    let erlenPechSize = CGSize(width: 380, height: 380)
    let marteloSize = CGSize(width: 200, height: 200)
    let mangueiraSize = CGSize(width: 200, height: 200)
    let petriSize = CGSize(width: 200, height: 200)
    let poteSize = CGSize(width: 200, height: 200)
    let dropperSize = CGSize(width: 200, height: 200)
    let journalSize = CGSize(width: 250, height: 250)
    let iconJournalSize = CGSize(width: 298, height: 357)
    let closeSize = CGSize(width: 33.05, height: 33.02)
    let retanguloSize = CGSize(width: 1197, height: 211)
    
    override func didMove(to view: SKView) {
        
        let menuButtonWidth: CGFloat = 57.23
        let menuButtonHeight: CGFloat = 50.09
        let safeArea = view.safeAreaLayoutGuide
        
        menuButton = SKSpriteNode(imageNamed: "menu")
        menuButton.position = CGPoint(x: safeArea.layoutFrame.maxX - 40 - menuButton.size.width / 2,
                                           y: safeArea.layoutFrame.maxY - 40 - menuButton.size.height / 2)
        menuButton.zPosition = 1
        menuButton.aspectFillToSize(self.size)
        menuButton.size = CGSize(width: menuButtonWidth, height: menuButtonHeight)
        
        addChild(menuButton)
        
        let background = SKSpriteNode(imageNamed: "game-screen-3")
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -1
        background.size = self.frame.size
        background.aspectFillToSize(self.size)
        self.addChild(background)
        
        positionThings()
    }
    
    func positionThings() {
        
        journal = SKSpriteNode(imageNamed: "journal")
        journal?.size = journalSize
        journal?.position = CGPoint(x: self.frame.midX+560, y: self.frame.midY-50)
        journal?.name = "journalButton"
        addChild(journal!)
        
        if let journal = journal {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + journal.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - journal.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + journal.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - journal.size.height / 2))
            journal.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        iconJournal = SKSpriteNode(imageNamed: "icon-journal")
        iconJournal?.size = iconJournalSize
        iconJournal?.position = CGPoint(x: self.frame.midX+560, y: self.frame.midY-50)
        iconJournal?.zPosition = -1
        addChild(iconJournal!)
        
        if let iconJournal = iconJournal {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + iconJournal.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - iconJournal.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + iconJournal.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - iconJournal.size.height / 2))
            iconJournal.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }

        erlenPechblenda = SKSpriteNode(imageNamed: "erlen-pechblenda")
        erlenPechblenda?.size = erlenPechSize
        erlenPechblenda.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(erlenPechblenda)
        
        retangulo = SKSpriteNode(imageNamed: "retangulo")
        retangulo?.size = retanguloSize
        retangulo?.position = CGPoint(x: 550, y: 105)
        retangulo?.zPosition = -1
        addChild(retangulo!)
        
        if let retangulo = retangulo {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + retangulo.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - retangulo.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + retangulo.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - retangulo.size.height / 2))
            retangulo.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if menuButton.contains(location) {
                goMenu()
            }
            
            if touchedNode.name == "journalButton" {
                
                // Display popup screen
                let popup = SKSpriteNode(imageNamed: "journal-3")
                popup.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
                popup.zPosition = 1
                popup.setScale(0)
                popup.size = CGSize(width: self.size.width * 0.9, height: self.size.height * 0.9)
                
                // Add close button to popup
                let closeButton = SKSpriteNode(imageNamed: "close")
                closeButton.position = CGPoint(x: 430, y: 290)
                closeButton.size = closeSize
                closeButton.name = "closeButton"
                popup.addChild(closeButton)
                
                addChild(popup)
                
                let scaleAction = SKAction.scale(to: 1.0, duration: 0.2)
                popup.run(scaleAction)
                
                let popupWidth = popup.size.width
                let popupHeight = popup.size.height
                let horizontalRange = SKRange(lowerLimit: popupWidth/2, upperLimit: self.size.width - popupWidth/2)
                let verticalRange = SKRange(lowerLimit: popupHeight/2, upperLimit: self.size.height - popupHeight/2)
                let popupConstraints = SKConstraint.positionX(horizontalRange, y: verticalRange)
                popup.constraints = [popupConstraints]
                
                let closeWidth = closeButton.size.width
                let closeHeight = closeButton.size.height
                let closehorizontalRange = SKRange(lowerLimit: closeWidth/2, upperLimit: self.size.width - closeWidth/2)
                let closeverticalRange = SKRange(lowerLimit: closeHeight/2, upperLimit: self.size.height - closeHeight/2)
                let closeConstraints = SKConstraint.positionX(closehorizontalRange, y: closeverticalRange)
                closeButton.constraints = [closeConstraints]
                
            } else if touchedNode.name == "closeButton" {
                
                // Remove popup screen
                if let popup = touchedNode.parent {
                    popup.removeFromParent()
                }
            }
            
            if erlenPechblenda.contains(location) {
                let transition = SKTransition.fade(withDuration: 1.0)
                let thirdGameScene = FourthGameScene(size: self.size)
                self.view?.presentScene(thirdGameScene, transition: transition)
            }
        }
        
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)        
    }
    
    func goMenu() {
        guard let view = view else { return }
        let gameScene = MenuScene(size: view.bounds.size)
        gameScene.scaleMode = .aspectFill
        let transition = SKTransition.fade(withDuration: 0.2)
        self.view?.presentScene(gameScene, transition: transition)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        if touchPlayer {
            martelo!.position = location
        }
        
        if touchPlayer2 {
            mangueira!.position = location
        }
        
        if touchPlayer3 {
            petri!.position = location
        }
        
        if touchPlayer4 {
            pote!.position = location
        }
        
        if touchPlayer5 {
            dropper!.position = location
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchPlayer = false
        
        touchPlayer2 = false
        
        touchPlayer3 = false
        
        touchPlayer4 = false
        
        touchPlayer5 = false
    }
}
