import SwiftUI

struct DailyScrumView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var senePhase
    let saveAction:()->Void
    
    var body: some View {
        List{
            ForEach(scrums){ scrum in
                NavigationLink {
                    DetailView(scrum: binding(for: scrum))
                } label: {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Daily Scrums")
        .navigationBarItems(leading: Button(action: {}, label: {
            Text("Leading Button")
        }), trailing: Button(action: {
            
        }, label: {
            Image(systemName: "plus")
        }))
        .onChange(of: senePhase){ phase in
            if phase == .inactive{
                saveAction()
            }
        }
    }
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum>{
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id})else{
            fatalError()
        }
            return $scrums[scrumIndex]
    }
}

struct DailyScrum_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DailyScrumView(scrums: .constant(DailyScrum.data),saveAction: {})
            
        }
    }
}
