import SwiftUI
import AVFoundation

struct TriangleArea: View {
    
    @State var baseTextFieldText: String = ""
    @State var lengthTextFieldText: String = ""
    
    @State var base: Float = 0.0
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
            
            Image(systemName: "triangle.fill")
                .resizable()
                .frame(maxWidth: 180, maxHeight: 180, alignment: .center)
                .scaledToFit()
                .foregroundColor(.red)
            
            Text("Input length")
                .font(.title2)
                    .padding()
                    .foregroundColor(.mint)
                    .frame(maxWidth: .infinity, alignment: .leading)

            TextField("ex. 50", text: $baseTextFieldText)
                .padding()
                .frame(maxWidth: 300)
                .background(Color.mint.opacity(0.2).cornerRadius(5))
                .foregroundColor(.purple)
                .font(.headline)
                .keyboardType(.numberPad)
            
            Text("Input base")
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
                
                base = (baseTextFieldText as NSString).floatValue
                length = (lengthTextFieldText as NSString).floatValue
                
            //Processing
                let reslut = 0.5 * base * length
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let reslutFormatted =
                numberFormatter.string(from:
                NSNumber(value:reslut))

            textToUser = "This triangle area is \(reslutFormatted ?? "0")"

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
        baseTextFieldText.removeAll()
        lengthTextFieldText.removeAll()
    }// clear
}

struct TriangleArea_Previews: PreviewProvider {
    static var previews: some View {
        TriangleArea()
    }
}
