import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresented = false
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    
    var body: some View {
        List{
            //section meeting info
            Section{
                NavigationLink(destination: MeetingView(scrum: $scrum)){
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)}
                HStack{
                    Label("Lenght", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack{
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
            } header:{
                        Text("Meeting Info")
            }
            //section attendees
            Section {
                ForEach(scrum.attendees, id: \.self){ attendee in
                    Label(attendee, systemImage: "person")
                }
            } header: {
                Text("Attendees")
            }
        }
        .navigationTitle(scrum.title)
        .navigationBarItems(trailing: Button("Edit", action: {
            isPresented = true
            data = scrum.data
        }))
        .fullScreenCover(isPresented: $isPresented){
            NavigationView{
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel", action: {
                        
                    }), trailing: Button("Done", action: {
                        isPresented = false
                        scrum.update(from: data)
                    }))
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(scrum: (.constant(DailyScrum.data[0])))
        }
    }
}
