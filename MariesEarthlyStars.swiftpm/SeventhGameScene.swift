//
//  SeventhGameScene.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 18/04/23.
//

import SpriteKit

class SeventhGameScene: SKScene {
    
    var petriPrecipitadosLiquido, menuButton: SKSpriteNode!
    var martelo, mangueira, pote, dropper, erlen, retangulo: SKSpriteNode?
    
    var touchPlayer: Bool = false
    var touchPlayer2: Bool = false
    var touchPlayer3: Bool = false
    var touchPlayer4: Bool = false
    var touchPlayer5: Bool = false
    
    let petriPrecipitadosLiquidoSize = CGSize(width: 380, height: 380)
    let marteloSize = CGSize(width: 200, height: 200)
    let mangueiraSize = CGSize(width: 200, height: 200)
    let poteSize = CGSize(width: 200, height: 200)
    let dropperSize = CGSize(width: 200, height: 200)
    let erlenSize = CGSize(width: 200, height: 200)
    let closeSize = CGSize(width: 33.05, height: 33.02)
    let retanguloSize = CGSize(width: 1197, height: 211)
    
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
        
        let background = SKSpriteNode(imageNamed: "game-screen-7")
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -1
        background.size = self.frame.size
        background.aspectFillToSize(self.size)
        self.addChild(background)
        
        positionThings()
    }
    
    func positionThings() {
        
        petriPrecipitadosLiquido = SKSpriteNode(imageNamed: "petri-precipitados-liquido")
        petriPrecipitadosLiquido?.size = petriPrecipitadosLiquidoSize
        petriPrecipitadosLiquido.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(petriPrecipitadosLiquido)

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
        if location.x <= pote!.position.x+100 && location.x >= pote!.position.x-100 && location.y <= pote!.position.y+100 && location.y >= pote!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer4(location: CGPoint) -> Bool {
        if location.x <= dropper!.position.x+100 && location.x >= dropper!.position.x-100 && location.y <= dropper!.position.y+100 && location.y >= dropper!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer5(location: CGPoint) -> Bool {
        if location.x <= erlen!.position.x+100 && location.x >= erlen!.position.x-100 && location.y <= erlen!.position.y+100 && location.y >= erlen!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "martelo" {
                touchPlayer = true
            } else if touchedNode.name == "mangueira" {
                touchPlayer2 = true
            } else if touchedNode.name == "pote" {
                touchPlayer3 = true
            } else if touchedNode.name == "dropper" {
                touchPlayer4 = true
            } else if touchedNode.name == "erlen" {
                touchPlayer5 = true
            }
            
            if touchedNode.name == "menuButton" {
                goMenu()
            }
            
            if petriPrecipitadosLiquido.contains(location) {
                let transition = SKTransition.fade(withDuration: 1.0)
                let seventhGameScene = JournalFirst(size: self.size)
                self.view?.presentScene(seventhGameScene, transition: transition)
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
            pote!.position = location
        }
        
        if touchPlayer4 {
            dropper!.position = location
        }
        
        if touchPlayer5 {
            erlen!.position = location
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchPlayer = false
            martelo?.position = CGPoint(x: self.frame.midX-550, y: self.frame.midY-380)
        
        touchPlayer2 = false
            mangueira?.position = CGPoint(x: self.frame.midX-290, y: self.frame.midY-380)
        
        touchPlayer3 = false
            pote?.position = CGPoint(x: self.frame.midX-100, y: self.frame.midY-380)
        
        touchPlayer4 = false
            dropper?.position = CGPoint(x: self.frame.midX+60, y: self.frame.midY-380)
        
        touchPlayer5 = false
            erlen?.position = CGPoint(x: self.frame.midX+230, y: self.frame.midY-380)
    }
}

