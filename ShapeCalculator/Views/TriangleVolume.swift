import SwiftUI
import AVFoundation

struct TriangleVolume: View {
    
    @State var lengthTextFieldText: String = ""
    @State var baseTextFieldText: String = ""
    @State var heightTextFieldText: String = ""
    
    @State var length: Float = 0.0
    @State var base: Float = 0.0
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
            
            Image(systemName: "pyramid")
                .resizable()
                .frame(maxWidth: 180, maxHeight: 180, alignment: .center)
                .scaledToFit()
                .foregroundColor(.red)

            HStack{
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
                
                VStack{
            Text("Input base")
                .font(.title3)
                .padding(.top)
                .foregroundColor(.mint)
                .frame(maxWidth: .infinity, alignment: .center)
            
            TextField("ex. 50", text: $baseTextFieldText)
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
                
                length = (lengthTextFieldText as NSString).floatValue
                height = (heightTextFieldText as NSString).floatValue
                base = (baseTextFieldText as NSString).floatValue
                
            //Processing
                let reslut = 0.5 * height * length * base
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let reslutFormatted =
                numberFormatter.string(from:
                NSNumber(value:reslut))

            textToUser = "This triangle volume is \(reslutFormatted ?? "0")"

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
        lengthTextFieldText.removeAll()
        baseTextFieldText.removeAll()
        heightTextFieldText.removeAll()
    }// clear
    
   
    
}

struct TriangleVolume_Previews: PreviewProvider {
    static var previews: some View {
        TriangleVolume()
    }
}
