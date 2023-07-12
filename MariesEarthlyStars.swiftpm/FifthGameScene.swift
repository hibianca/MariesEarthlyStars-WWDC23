//
//  FifthGameScene.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 18/04/23.
//

import SpriteKit

class FifthGameScene: SKScene {
    
    var erlenPrecipitadoMangueira, menuButton: SKSpriteNode!
    var martelo, petri, pote, dropper, retangulo: SKSpriteNode?
    
    var touchPlayer: Bool = false
    var touchPlayer2: Bool = false
    var touchPlayer3: Bool = false
    var touchPlayer4: Bool = false
    var touchPlayer5: Bool = false
    
    let erlenPrecipitadoMangueiraSize = CGSize(width: 208, height: 408)
    let marteloSize = CGSize(width: 200, height: 200)
    let mangueiraSize = CGSize(width: 200, height: 200)
    let petriSize = CGSize(width: 200, height: 200)
    let poteSize = CGSize(width: 200, height: 200)
    let dropperSize = CGSize(width: 200, height: 200)
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
        
        let background = SKSpriteNode(imageNamed: "game-screen-5")
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -1
        background.size = self.frame.size
        background.aspectFillToSize(self.size)
        self.addChild(background)
        
        positionThings()
    }
    
    func positionThings() {
        
        erlenPrecipitadoMangueira = SKSpriteNode(imageNamed: "erlen-precipitados-mangeira-vapor")
        erlenPrecipitadoMangueira?.size = erlenPrecipitadoMangueiraSize
        erlenPrecipitadoMangueira.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(erlenPrecipitadoMangueira)
        
        martelo = SKSpriteNode(imageNamed: "martelo")
        martelo?.name = "martelo"
        martelo?.size = marteloSize
        martelo?.position = CGPoint(x: self.frame.midX-550, y: self.frame.midY-380)
        addChild(martelo!)
        
        if let martelo = martelo {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + martelo.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - martelo.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + martelo.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - martelo.size.height / 2))
            martelo.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        petri = SKSpriteNode(imageNamed: "petri")
        petri?.name = "petri"
        petri?.size = petriSize
        petri?.position = CGPoint(x: self.frame.midX-310, y: self.frame.midY-380)
        addChild(petri!)
        
        if let petri = petri {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + petri.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - petri.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + petri.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - petri.size.height / 2))
            petri.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        pote = SKSpriteNode(imageNamed: "pote")
        pote?.name = "pote"
        pote?.size = poteSize
        pote?.position = CGPoint(x: self.frame.midX-100, y: self.frame.midY-380)
        addChild(pote!)
        
        if let pote = pote {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + pote.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - pote.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + pote.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - pote.size.height / 2))
            pote.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        dropper = SKSpriteNode(imageNamed: "dropper")
        dropper?.name = "dropper"
        dropper?.size = dropperSize
        dropper?.position = CGPoint(x: self.frame.midX+60, y: self.frame.midY-380)
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
        if location.x <= petri!.position.x+100 && location.x >= petri!.position.x-100 && location.y <= petri!.position.y+100 && location.y >= petri!.position.y-100 {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "martelo" {
                touchPlayer = true
            } else if touchedNode.name == "petri" {
                touchPlayer2 = true
            } else if touchedNode.name == "pote" {
                touchPlayer3 = true
            } else if touchedNode.name == "dropper" {
                touchPlayer4 = true
            }
            
            if touchedNode.name == "menuButton" {
                goMenu()
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
            petri!.position = location
        }
        
        if touchPlayer3 {
            pote!.position = location
        }
        
        if touchPlayer4 {
            dropper!.position = location
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchPlayer = false
            martelo?.position = CGPoint(x: self.frame.midX-550, y: self.frame.midY-380)
        
        touchPlayer2 = false
            petri?.position = CGPoint(x: self.frame.midX-310, y: self.frame.midY-380)
        
        touchPlayer3 = false
            pote?.position = CGPoint(x: self.frame.midX-100, y: self.frame.midY-380)
        
        touchPlayer4 = false
            dropper?.position = CGPoint(x: self.frame.midX+60, y: self.frame.midY-380)
        
        if erlenPrecipitadoMangueira!.color == .red {
            let fifthScene = SixthGameScene(size: self.size)
            fifthScene.scaleMode = self.scaleMode
            let transition = SKTransition.fade(withDuration: 0.2)
            self.view?.presentScene(fifthScene, transition: transition)
            petri?.position = CGPoint(x: self.frame.midX-200, y: self.frame.midY-200)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if erlenPrecipitadoMangueira!.position.x+80 <= petri!.position.x+200 && erlenPrecipitadoMangueira!.position.x-80 >= petri!.position.x-200 && erlenPrecipitadoMangueira!.position.y+80 <= petri!.position.y+200 && erlenPrecipitadoMangueira!.position.y-80 >= petri!.position.y-200 {
            
            erlenPrecipitadoMangueira!.color = UIColor.red
        }
    }
}
