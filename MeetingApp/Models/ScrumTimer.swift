import Foundation

class ScrumTimer: ObservableObject{
//Model สำหรับจัดการเรื่องเวลา และ ผู้พูด
struct Speaker: Identifiable{
      let id: UUID = UUID()
      let name: String
      var isCompleted: Bool
  }
@Published var secondsElapsed = 0
@Published var secondsRemaining = 0

var speakers: [Speaker] = []
var lengthInMinutes: Int
var speakerChangedAction: (() -> Void)?

private var timer: Timer?
private var timerStoped: Bool = false
private var frequency: TimeInterval { 1.0/60.0 }
private var lengthInSeconds: Int {lengthInMinutes * 60}
private var secondsPerSpeaker: Int {
    lengthInSeconds / speakers.count
}
private var secondsElapsedForSpeaker: Int = 0
private var speakerIndex = 0
    
private var startDate: Date?


init(lengthInMinutes: Int = 0, attendees: [String] = []){
    self.lengthInMinutes = lengthInMinutes
    //condition ? do if condition is true : do when condition is false
      self.speakers = attendees.isEmpty ? [Speaker(name: "Player 1", isCompleted: false)] : attendees.map({attendee in Speaker(name: attendee, isCompleted: false)
    //Mapping array of string ของ attendees เป็น array of Speaker
    })
    secondsRemaining = lengthInSeconds
}
func startScrum(){
    //start with speaker at index 0
    changeToSpeaker(at: 0)

}

func stopScrum(){
    timer?.invalidate()
    timer = nil
    timerStoped = true
}


func reset(lengthInMinutes: Int, attendees: [String]){
    self.lengthInMinutes = lengthInMinutes
      self.speakers = attendees.isEmpty ? [Speaker(name: "Player 1", isCompleted: false)] : attendees.map({attendee in Speaker(name: attendee, isCompleted: false)
    //Mapping array of string ของ attendees เป็น array of Speaker
    })
}
    
private func changeToSpeaker(at index: Int){
    if index > 0 {
      let previousSpeakerIndex = index - 1
      speakers[previousSpeakerIndex].isCompleted = true
}
    secondsElapsedForSpeaker = 0
      guard index < speakers.count else { return }
    speakerIndex = index

    secondsElapsed = index * secondsPerSpeaker
    secondsRemaining = lengthInSeconds - secondsElapsed
        
      startDate = Date()

    timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true, block: {[weak self] timer in
        if let self = self, let startDate = self.startDate {
            let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
          // update seconds elapsed
          self.update(secondsElapsed: Int(secondsElapsed))
        }
    })
}
private func update(secondsElapsed: Int){
    //update วินาทีที่ใช้ไปแล้ว สำหรับ speaker คนนี้
    secondsElapsedForSpeaker = secondsElapsed
     // เอาไว้อัพเดท UI ที่ observe secondsElapsed
    self.secondsElapsed = secondsPerSpeaker * speakerIndex + secondsElapsedForSpeaker
    guard !timerStoped else { return }

    if secondsElapsedForSpeaker >= secondsPerSpeaker {
      changeToSpeaker(at: speakerIndex + 1)
        
        speakerChangedAction?()
    }
  }
}
