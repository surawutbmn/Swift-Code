import SwiftUI
import AVFoundation

struct TimerView: View {
    
    
    @ObservedObject var timerManager = TimerManager()
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    var player: AVPlayer {
        AVPlayer.sharedPopPlayer
    }
    var player2: AVPlayer {
        AVPlayer.sharedClickPlayer
    }
    
    var body: some View {
        
            VStack{
                Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                    .font(.system(size: 80))
                    .padding(.top, 80)
                    .foregroundColor(.mint)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.purple)
                    .onTapGesture {
                        player.seek(to: .zero)
                        player.play()
                        if self.timerManager.timerMode == .initial{
                            self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex]*60)
                        }
                        self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                    }
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .padding(.top, 30)
                        .foregroundColor(.red)
                        .onTapGesture(perform: {
                            player2.seek(to: .zero)
                            player2.play()
                            self.timerManager.reset()
                        })
                }
                if timerManager.timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< availableMinutes.count){
                            Text("\(self.availableMinutes[$0]) min")
                        }
                    }
                }
                
                Spacer()
            }
        .environment(\.colorScheme, .light)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
