import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading){
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)",systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(.black)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
