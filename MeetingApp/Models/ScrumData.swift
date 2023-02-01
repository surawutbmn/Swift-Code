import Foundation

class ScrumData: ObservableObject{
    
    private static var documentsFolder: URL{
        do{
            return try FileManager.default.url(for: .documentDirectory,
                                              in: .userDomainMask,
                                              appropriateFor: nil,
                                              create: false)
        }catch{
            fatalError("Can't find documents directory")
        }
    }
    
    private static var fileURL: URL{
        documentsFolder.appendingPathComponent("scrums.data")
    }
    
    @Published var scrums: [DailyScrum] = []


func save(){
    DispatchQueue.global(qos: .background).async { [weak self] in
        guard let scrums = self?.scrums else{
            fatalError("Self out of scope")
        }
        guard let data = try? JSONEncoder().encode(scrums) else{
            fatalError()
        }
        do{
        let outfile = Self.fileURL
        try data.write(to: outfile)
        }catch{
            fatalError("Can't write to file")
        }
        }
    }
    func load(){
        DispatchQueue.global(qos: .background).async {[weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else{
                DispatchQueue.main.async {
                    self?.scrums = DailyScrum.data
                }
                return
            }
            
            //data -> struct
            guard let DailyScrums = try? JSONDecoder().decode([DailyScrum].self, from: data) else{
                fatalError("Can,t decode saved scrum data.")
            }
            DispatchQueue.main.async {
                self?.scrums = DailyScrums
            }
        }
    }
}
