import SwiftUI
import AVFoundation
struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
//    var player: AVPlayer {
//        AVPlayer.sharedDingPlayer
//      }
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack{
                //header
                MeetingHeaderView(secondElapsed: scrumTimer.secondsElapsed, secondRemaining: scrumTimer.secondsRemaining)
                //timer
                MeetingTimerView(speakers: scrumTimer.speakers, scrumColor: scrum.color)
                //footer
                MeetingFooterView(speakers: scrumTimer.speakers)
            }
        }
        .padding()
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees:
                                scrum.attendees)
            scrumTimer.speakerChangedAction = {
                //player.seek(to: .zero)
                //player.play()
            }
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}
