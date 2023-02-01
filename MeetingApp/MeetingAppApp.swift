import SwiftUI

@main
struct MeetingAppApp: App {
//    @State private var scrums = DailyScrum.data
    @StateObject private var data = ScrumData()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                DailyScrumView(scrums: $data.scrums, saveAction: {
                    data.save()
                })
            }
            .onAppear {
                data.load()
            }
        }
    }
}
