import Foundation
import SwiftUI
struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    
    init( id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
    }
}

extension DailyScrum{
    mutating func update(from data: Data){
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
    }
}

extension DailyScrum {
    static var data: [DailyScrum]{
        [
            DailyScrum(title: "Design", attendees: ["Cathy","Daisy","Simon","Jonathan"], lengthInMinutes: 10, color: Color("TesterColor")),
            DailyScrum(title: "App Dev", attendees: ["Katie","Gray","Euna","Luis","Darla"], lengthInMinutes: 5, color: Color("AppColor")),
            DailyScrum(title: "Web Dev", attendees: ["Jack","David","Peter","Chella","Karla","Lindsey","Sarah","Aga","Jenn","Eden"], lengthInMinutes: 1, color: Color("WebColor"))
        ]
    }
}

extension DailyScrum{
    //to edit to create datatype for UI
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 0.0
        var color: Color = .pink
    }
    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
}
