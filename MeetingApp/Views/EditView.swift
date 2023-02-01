import SwiftUI

struct EditView: View {
    
    @Binding var scrumData: DailyScrum.Data
    @State private var newAttendee = ""
    var body: some View {
        List{
            //meeting info
            Section {
                TextField("Title", text: $scrumData.title)
                HStack{
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)). minutes")
                }
                ColorPicker("Color", selection: $scrumData.color)
            } header: {
                Text("Meeting Info")
            }

            //attendees
            Section{
                ForEach(scrumData.attendees, id: \.self){ attendee in
                    Text(attendee)
                }
                .onDelete { indexSet in
                    scrumData.attendees.remove(atOffsets: indexSet)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendee)
                    Button {
                        withAnimation {
                            //add attendee to scrumData & delete name on textfield
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }header: {
                Text("Attendees")
            }
            
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(scrumData: .constant(DailyScrum.data[0].data))
    }
}
