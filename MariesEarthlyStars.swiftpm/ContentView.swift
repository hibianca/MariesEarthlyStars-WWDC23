import SwiftUI
import SpriteKit
import AVFoundation

struct ContentView: View {
    @State var showOnboarding = true
    
    var scene: SKScene {
        let scene = showOnboarding ? OnboardingScene() : MenuScene()
        scene.size = CGSize(width: 1194, height: 834)
        scene.scaleMode = .aspectFill
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
        .onAppear {
            playSound(sound: "gardenOfMagicBySoundroll", type: "mp3", volume: 0.2, numberOfLoops: -1)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
