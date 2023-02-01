import SwiftUI

struct CircleVolumeView: View {
    
    @State var radiusTextFieldText: String = ""
    
    @State var radius: Float = 0.0
    @State var pi: Float = 22/7
    
    @State var textToUser: String = ""
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        VStack{
        Text("Volume")
            .font(.system(size: 40).bold())
            .foregroundColor(.mint)
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Circle()
                .frame(maxWidth: 180, maxHeight: 180)
                .scaledToFit()
                .foregroundColor(.yellow)
                
            
            Text("Input radius")
                .font(.title2)
                    .padding()
                    .foregroundColor(.mint)
                    .frame(maxWidth: .infinity, alignment: .leading)

            TextField("ex. 50", text: $radiusTextFieldText)
                .padding()
                    .frame(maxWidth: 300)
                    .background(Color.mint.opacity(0.2).cornerRadius(5))
                    .foregroundColor(.purple)
                    .font(.headline)
                    .keyboardType(.numberPad)
                
            
            Button(action: { hideKeyboard()

            radius = (radiusTextFieldText as NSString).floatValue
                
            //Processing
            let reslut = 2 * pi * radius
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let reslutFormatted =
                numberFormatter.string(from:
                NSNumber(value:reslut))

            textToUser = "This circle volume is \(reslutFormatted ?? "0")"

            alertIsVisible = true
            }) {
            Text("Calculate")
                    .frame(maxWidth: 300, maxHeight: 30)
                    .background(Color.mint.cornerRadius(5))
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding()
        }//end Btn
            .alert(isPresented: $alertIsVisible, content: {
                return Alert(title: Text("Calculate Reslut"), message:
                Text(textToUser), dismissButton:
                Alert.Button.default(
                    Text("Okay"), action: {
                        clear()
                }
            ))
        })//end alert
            
        }//vstack
    }
    func clear(){
        radiusTextFieldText.removeAll()
    }// clear
}


struct CircleValueView_Previews: PreviewProvider {
    static var previews: some View {
        CircleVolumeView()
    }
}
