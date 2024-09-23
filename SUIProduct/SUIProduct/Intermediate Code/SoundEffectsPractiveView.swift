//
//  SoundEffectsPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/19.
//

import SwiftUI
import AVKit

class SoundManager{
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    enum SoundOption: String{
        case tada
        case badum
        var type:String{
            switch self {
            case .tada:
                return ".wav"
            case .badum:
                return ".m4a"
            }
        }
    }
    func playSound(sound: SoundOption){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: sound.type) else{return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let errey{
            print("Errow playing sound. \(errey.localizedDescription)")
        }
        
        
    }
}


struct SoundEffectsPractiveView: View {
    var body: some View {
        VStack(spacing: 40.0) {
            Button("Play Sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play Sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundEffectsPractiveView()
}
