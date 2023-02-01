import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    private var isLastSpeaker: Bool{
        return speakers.dropLast().allSatisfy{$0.isCompleted}
    }
    private var speakerNumber: Int?{
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else{return nil}
        return index + 1
    }
    private var speakerText: String{
        guard let speakerNumber = speakerNumber else {
            return "No more speakers"
        }
        return "speaker \(speakerNumber) of \(speakers.count)"
    }
    var body: some View {
        HStack{
            if isLastSpeaker{
                Text("Last Speaker")
            }else{
            Text(speakerText)
            Spacer()
            Button {} label: {
                Image(systemName: "forward.fill")
            }

        }
    }
        .padding([.bottom,.horizontal])
  }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var speakers = [ScrumTimer.Speaker(name: "Champ", isCompleted: false), ScrumTimer.Speaker(name: "Not", isCompleted: false)]
    static var previews: some View {
        MeetingFooterView(speakers: speakers)
            .previewLayout(.sizeThatFits)
    }
}
