import SwiftUI

struct ContentView: View {
    
    @State private var isPresentedObj: Bool = false
    @State private var isPresentedTimer: Bool = false
    @State private var isPresentedHis: Bool = false
    
    var body: some View {
        VStack(spacing: 50){
            Text("ShapeCals")
                .foregroundColor(.mint)
                .font(.system(size: 70).bold())
                .padding()
            
            //Object
            Button ("Objects"){
                isPresentedObj.toggle()
            }
            .fullScreenCover(isPresented: $isPresentedObj) {
                NavigationView{
                    ObjectView()
                            .navigationTitle("Objects")
                            .navigationBarItems(trailing: Button("Back", action: {
                            isPresentedObj = false
                        }))
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
            }
            .padding()
            .frame(maxWidth: 250, maxHeight: 80)
            .background(.purple)
            .cornerRadius(20)
            .foregroundColor(.white)
            .font(.system(size: 50).bold())
            
            
            //Timer
            Button ("Timer"){
                isPresentedTimer.toggle()
            }
            .sheet(isPresented: $isPresentedTimer) {
                NavigationView{
                    TimerView()
                        .navigationTitle("Timer")
                        .navigationBarItems( trailing: Button("Back", action: {
                            isPresentedTimer = false
                        }))
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
            }
            .padding()
            .frame(maxWidth: 250, maxHeight: 80)
            .background(.purple)
            .cornerRadius(20)
            .foregroundColor(.white)
            .font(.system(size: 50).bold())
            
            
            Button ("History"){
                isPresentedHis.toggle()
            }
            .fullScreenCover(isPresented: $isPresentedHis) {
                NavigationView{
                  HistoryView()
                            .navigationTitle("History")
                            .navigationBarItems(trailing: Button("Back", action: {
                            isPresentedHis = false
                        }))
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                
            }
            .padding()
            .frame(maxWidth: 250, maxHeight: 80)
            .background(.purple)
            .cornerRadius(20)
            .foregroundColor(.white)
            .font(.system(size: 50).bold())
            
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
