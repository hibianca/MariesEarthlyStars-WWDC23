import SwiftUI
import SpriteKit
import UIKit

struct ContentView: View {
    @State var showOnboarding = true
    
    var scene: SKScene {
        let scene = showOnboarding ? OnboardingScene() : MenuScene()
        scene.size = CGSize(width: 1194, height: 834)
        scene.scaleMode = .aspectFit
        return scene
    }
    
    var body: some View {
        VStack{
            SpriteView(scene: scene)
                .ignoresSafeArea(.all)
        }
        .onAppear {
            let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
            if launchedBefore {
                showOnboarding = false
            } else {
                showOnboarding = true
                UserDefaults.standard.set(true, forKey: "launchedBefore")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
