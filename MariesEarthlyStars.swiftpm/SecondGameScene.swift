//
//  SecondGameScene.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 14/04/23.
//

import SpriteKit

class SecondGameScene: SKScene {
    
    var menuButton: SKSpriteNode!
    
    var potePechblenda: SKSpriteNode?
    var martelo: SKSpriteNode?
    var mangueira: SKSpriteNode?
    var petri: SKSpriteNode?
    var erlen: SKSpriteNode?
    var dropper: SKSpriteNode?
    var journal: SKSpriteNode?
    var iconJournal: SKSpriteNode?
    var retangulo: SKSpriteNode?
    
    var touchPlayer: Bool = false
    var touchPlayer2: Bool = false
    var touchPlayer3: Bool = false
    var touchPlayer4: Bool = false
    var touchPlayer5: Bool = false
    
    let potePechSize = CGSize(width: 380, height: 380)
    let marteloSize = CGSize(width: 200, height: 200)
    let mangueiraSize = CGSize(width: 200, height: 200)
    let petriSize = CGSize(width: 200, height: 200)
    let erlenSize = CGSize(width: 200, height: 200)
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
        
        let background = SKSpriteNode(imageNamed: "game-screen-2")
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
        
        potePechblenda = SKSpriteNode(imageNamed: "pote-pechblenda")
        potePechblenda?.size = potePechSize
        potePechblenda?.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(potePechblenda!)
        
        martelo = SKSpriteNode(imageNamed: "martelo")
        martelo?.name = "martelo"
        martelo?.size = marteloSize
        //player = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        martelo?.position = CGPoint(x: self.frame.midX-550, y: self.frame.midY-380)
        addChild(martelo!)
        
        if let martelo = martelo {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + martelo.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - martelo.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + martelo.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - martelo.size.height / 2))
            martelo.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        mangueira = SKSpriteNode(imageNamed: "mangueira")
        mangueira?.name = "mangueira"
        mangueira?.size = mangueiraSize
        mangueira?.position = CGPoint(x: self.frame.midX-290, y: self.frame.midY-380)
        addChild(mangueira!)
        
        if let mangueira = mangueira {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + mangueira.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - mangueira.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + mangueira.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - mangueira.size.height / 2))
            mangueira.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        petri = SKSpriteNode(imageNamed: "petri")
        petri?.name = "petri"
        petri?.size = petriSize
        petri?.position = CGPoint(x: self.frame.midX-100, y: self.frame.midY-380)
        addChild(petri!)
        
        if let petri = petri {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + petri.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - petri.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + petri.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - petri.size.height / 2))
            petri.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        erlen = SKSpriteNode(imageNamed: "erlen")
        erlen?.name = "erlen"
        erlen?.size = erlenSize
        erlen?.position = CGPoint(x: self.frame.midX+60, y: self.frame.midY-380)
        addChild(erlen!)
        
        if let erlen = erlen {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + erlen.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - erlen.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + erlen.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - erlen.size.height / 2))
            erlen.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        dropper = SKSpriteNode(imageNamed: "dropper")
        dropper?.name = "dropper"
        dropper?.size = dropperSize
        dropper?.position = CGPoint(x: self.frame.midX+230, y: self.frame.midY-400)
        addChild(dropper!)
        
        if let dropper = dropper {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + dropper.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - dropper.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + dropper.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - dropper.size.height / 2))
            dropper.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
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
    
    func isPlayer(location: CGPoint) -> Bool {
        if location.x <= martelo!.position.x+100 && location.x >= martelo!.position.x-100 && location.y <= martelo!.position.y+100 && location.y >= martelo!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer2(location: CGPoint) -> Bool {
        if location.x <= mangueira!.position.x+100 && location.x >= mangueira!.position.x-100 && location.y <= mangueira!.position.y+100 && location.y >= mangueira!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer3(location: CGPoint) -> Bool {
        if location.x <= petri!.position.x+100 && location.x >= petri!.position.x-100 && location.y <= petri!.position.y+100 && location.y >= petri!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer4(location: CGPoint) -> Bool {
        if location.x <= erlen!.position.x+100 && location.x >= erlen!.position.x-100 && location.y <= erlen!.position.y+100 && location.y >= erlen!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer5(location: CGPoint) -> Bool {
        if location.x <= dropper!.position.x+100 && location.x >= dropper!.position.x-100 && location.y <= dropper!.position.y+100 && location.y >= dropper!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if menuButton.contains(location) {
                goMenu()
            }
            
            if touchedNode.name == "martelo" {
                touchPlayer = true
            } else if touchedNode.name == "mangueira" {
                touchPlayer2 = true
            } else if touchedNode.name == "petri" {
                touchPlayer3 = true
            } else if touchedNode.name == "erlen" {
                touchPlayer4 = true
            } else if touchedNode.name == "dropper" {
                touchPlayer5 = true
            }
            
            if touchedNode.name == "journalButton" {
                
                // Display popup screen
                let popup = SKSpriteNode(imageNamed: "journal-2")
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
            
        }
        
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
    }
    
    func goMenu() {
        guard let view = view else { return }
        let secondGameScene = MenuScene(size: view.bounds.size)
        secondGameScene.scaleMode = .aspectFill
        let transition = SKTransition.fade(withDuration: 0.2)
        self.view?.presentScene(secondGameScene, transition: transition)
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
            erlen!.position = location
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
        
        if potePechblenda!.color == .red {
            let thirdScene = ThirdGameScene(size: self.size)
            thirdScene.scaleMode = self.scaleMode
            let transition = SKTransition.fade(withDuration: 0.2)
            self.view?.presentScene(thirdScene, transition: transition)
            erlen?.position = CGPoint(x: self.frame.midX-200, y: self.frame.midY-200)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if potePechblenda!.position.x+80 <= erlen!.position.x+200 && potePechblenda!.position.x-80 >= erlen!.position.x-200 && potePechblenda!.position.y+80 <= erlen!.position.y+200 && potePechblenda!.position.y-80 >= erlen!.position.y-200 {
            
            potePechblenda!.color = UIColor.red
        }
    }
    
}
