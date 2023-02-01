import SwiftUI

struct MeetingHeaderView: View {
    let secondElapsed: Int
    let secondRemaining: Int
    
    private var progress: Double{
        guard secondRemaining > 0 else { return 1 }
        let totalSecond = Double(secondElapsed  + secondRemaining)
        return Double(secondElapsed) / totalSecond
    }
    
    var body: some View {
        
        VStack{
            //progress
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle())
            //timeremaining
            HStack{
                VStack{
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack{
                    Text("Seconds Remaining")
                        .font(.caption)
                    HStack{
                    Text("\(secondRemaining)")
                        Image(systemName: "hourglass.bottomhalf.fill")
                            
                            
                    }
                }
        }
    }
        .padding([.top, .horizontal])
}
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondElapsed: 60, secondRemaining: 180)
            .previewLayout(.sizeThatFits)
        
    }
}
