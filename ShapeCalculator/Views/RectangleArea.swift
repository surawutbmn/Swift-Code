import SwiftUI

struct RectangleArea: View {
    
    @State var widthTextFieldText: String = ""
    @State var lengthTextFieldText: String = ""
    
    @State var width: Float = 0.0
    @State var length: Float = 0.0
    
    @State var textToUser: String = ""
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        
        VStack{
            Text("Area")
                .font(.system(size: 35).bold())
                .foregroundColor(.mint)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Rectangle()
                .frame(maxWidth: 180, maxHeight: 180)
                .scaledToFit()
                .foregroundColor(.blue)
            
            Text("Input width")
                .font(.title2)
                    .padding()
                    .foregroundColor(.mint)
                    .frame(maxWidth: .infinity, alignment: .leading)

            TextField("ex. 50", text: $widthTextFieldText)
                .padding()
                .frame(maxWidth: 300)
                .background(Color.mint.opacity(0.2).cornerRadius(5))
                .foregroundColor(.purple)
                .font(.headline)
                .keyboardType(.numberPad)
            
            Text("Input length")
                .font(.title2)
                    .padding()
                    .foregroundColor(.mint)
                    .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex. 50", text: $lengthTextFieldText)
                .padding()
                .frame(maxWidth: 300)
                .background(Color.mint.opacity(0.2).cornerRadius(5))
                .foregroundColor(.purple)
                .font(.headline)
                .keyboardType(.numberPad)
            
            Button(action: { hideKeyboard()
                
                width = (widthTextFieldText as NSString).floatValue
                length = (lengthTextFieldText as NSString).floatValue
                
            //Processing
            let reslut = width * length
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let reslutFormatted =
                numberFormatter.string(from:
                NSNumber(value:reslut))

            textToUser = "This rectangle area is \(reslutFormatted ?? "0")"

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
        widthTextFieldText.removeAll()
        lengthTextFieldText.removeAll()
    }// clear
}

struct RectangleArea_Previews: PreviewProvider {
    static var previews: some View {
        RectangleArea()
    }
}
