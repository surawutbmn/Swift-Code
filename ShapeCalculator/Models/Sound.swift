import Foundation
import AVFoundation

extension AVPlayer{
    static let sharedPopPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "pop", withExtension: "wav")
        else{
            fatalError("Failed to find sound file")
        }
        return AVPlayer(url: url)
    }()
}

extension AVPlayer{
    static let sharedClickPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "wav")
        else{
            fatalError("Failed to find sound file")
        }
        return AVPlayer(url: url)
    }()
}

extension AVPlayer{
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "mp3")
        else{
            fatalError("Failed to find sound file")
        }
        return AVPlayer(url: url)
    }()
}
