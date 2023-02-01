import SwiftUI
import AVFoundation

struct RectangleVolume: View {
    
    @State var widthTextFieldText: String = ""
    @State var lengthTextFieldText: String = ""
    @State var heightTextFieldText: String = ""
    
    @State var width: Float = 0.0
    @State var length: Float = 0.0
    @State var height: Float = 0.0
    
    @State var textToUser: String = ""
    @State var alertIsVisible: Bool = false

    
    var body: some View {
        VStack(){
            Text("Volume")
                .font(.system(size: 35).bold())
                .foregroundColor(.mint)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Image(systemName: "cube.transparent")
                .resizable()
                .frame(maxWidth: 180, maxHeight: 180, alignment: .center)
                .scaledToFit()
                .foregroundColor(.blue)

            HStack{
                VStack{
            Text("Input width")
                .font(.title3)
                .padding(.top)
                .foregroundColor(.mint)
                .frame(maxWidth: .infinity, alignment: .center)

            TextField("ex. 50", text: $widthTextFieldText)
                        .padding(.leading)
                .frame(maxWidth: 150, maxHeight: 40, alignment: .center)
                .background(Color.mint.opacity(0.2).cornerRadius(5))
                .foregroundColor(.purple)
                .font(.headline)
                .keyboardType(.numberPad)
                }
                
                VStack{
            Text("Input length")
                .font(.title3)
                .padding(.top)
                .foregroundColor(.mint)
                .frame(maxWidth: .infinity, alignment: .center)
            
            TextField("ex. 50", text: $lengthTextFieldText)
                        .padding(.leading)
                .frame(maxWidth: 150, maxHeight: 40, alignment: .center)
                .background(Color.mint.opacity(0.2).cornerRadius(5))
                .foregroundColor(.purple)
                .font(.headline)
                .keyboardType(.numberPad)
                }
            }
            Text("Input height")
                .font(.title3)
                .foregroundColor(.mint)
                .frame(maxWidth: .infinity, alignment: .center)
            
            TextField("ex. 50", text: $heightTextFieldText)
                .padding()
                .frame(maxWidth: 200, maxHeight: 40)
                .background(Color.mint.opacity(0.2).cornerRadius(5))
                .foregroundColor(.purple)
                .font(.headline)
                .keyboardType(.numberPad)
            
            Button(action: { hideKeyboard()
                
                width = (widthTextFieldText as NSString).floatValue
                height = (heightTextFieldText as NSString).floatValue
                length = (lengthTextFieldText as NSString).floatValue
                
            //Processing
            let reslut = width * length * height
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let reslutFormatted =
                numberFormatter.string(from:
                NSNumber(value:reslut))

            textToUser = "This rectangle volume is \(reslutFormatted ?? "0")"
               

            alertIsVisible = true
            }) {
            Text("Calculate")
                    .frame(maxWidth: 300, maxHeight: 40)
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
        heightTextFieldText.removeAll()
    }// clear
   
    
}


struct RectangleVolume_Previews: PreviewProvider {
    static var previews: some View {
        RectangleVolume()
    }
}
