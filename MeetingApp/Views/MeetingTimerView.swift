import SwiftUI

struct SpeakerArc: Shape{
    let speakerIndex: Int
    let totalSpeaker: Int
    
    private var degreePerSpeaker: Double{
        360.0/Double(totalSpeaker)
    }
    
    private var startAngle: Angle{
        Angle(degrees: degreePerSpeaker * Double(speakerIndex) + 1.0)
    }
    private var endAngle: Angle{
        Angle(degrees: startAngle.degrees + degreePerSpeaker - 1.0)
    }
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.origin.x + rect.size.width/2.0, y: rect.origin.y + rect.size.width/2.0)
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2
        
        return Path { Path in
            Path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let scrumColor: Color
    private var currentSpeaker: String{
        speakers.first(where: {!$0.isCompleted})?.name ?? "Someone"
    }
    var body: some View {
        ZStack{
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            VStack{
            Text(currentSpeaker)
                .font(.title)
            Text("is speaking")
            }
            ForEach(speakers){speaker in
                if speaker.isCompleted,
                   let index = speakers.firstIndex(where: { $0.id == speaker.id}){
                    SpeakerArc(speakerIndex: index, totalSpeaker: speakers.count)
                        .rotation(Angle(degrees: -90))
                        .stroke(scrumColor, lineWidth: 12)
                }
                
            }
        }
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers = [ScrumTimer.Speaker(name: "Champ", isCompleted: false), ScrumTimer.Speaker(name: "Not", isCompleted: false)]
    static var previews: some View {
        MeetingTimerView(speakers: speakers, scrumColor: .blue)
    }
}
