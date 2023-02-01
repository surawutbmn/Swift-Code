//
//  ContentView.swift
//  Sale S 631310081
//
//  Created by surawut binmamud on 29/10/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @State var priceTextFieldText: String = ""
    @State var saleTextFieldText: String = ""
    @State var dataHistoryArray: [String] = []
    
    @State var alertIsVisible: Bool = false
    @State var textToUser: String = ""

    @State var price: Float = 0.0
    @State var sale: Float = 0.0
    
    var body: some View {
        VStack {
        Text("กรุณากรอกราคา (เช่น 1590)")
                .padding()
                .foregroundColor(Color.green)
                .frame(maxWidth: .infinity, alignment: .leading)

        TextField("ex. 1590", text: $priceTextFieldText)
                .padding() //(n) เครื่องรอง,นุ่นที่ใช้ยัดเบาะ,การขยายความ
                .background(Color.green.opacity(0.2).cornerRadius(5))
                .foregroundColor(.green)
                .font(.headline)
                .keyboardType(.numberPad)
        Text("กรุณากรอกส่วนลดที่ต้องการ (%)")
                .padding()
                .foregroundColor(Color.green)
                .frame(maxWidth: .infinity, alignment: .leading)
        TextField("ex. 10", text: $saleTextFieldText)
                .padding()
                .background(Color.green.opacity(0.2).cornerRadius(5))
                .foregroundColor(.green)
                .font(.headline)
                .keyboardType(.numberPad)
            
            Button(action: { hideKeyboard()
            print("value in priceTextFieldText =\(priceTextFieldText)")

            print("value in saleTextFieldText =\(saleTextFieldText)")

            price = (priceTextFieldText as NSString).floatValue
            sale = (saleTextFieldText as NSString).floatValue
            // price กับ sale ประกาศมาใหม่ที่ข้างบน
            // ทําไมต้องแปลงค่าด้วย
            // ก. เพื่อทําเล่นๆ ว่าง เบื่อๆ
            // ข. เพื่อเอาไปคํานวณ เพราะตัวอักษร (String) มันคํานวณ (+-*/) ไม่ได้
                
            //Processing
            let finalPrice = price - (price * (sale / 100))
            print("value in finalPrice = \(finalPrice)")
            //จัดให้ตัวเลขมีเครื่องหมายคั่นหลัก 1,000
            //Keyword: swift number formatter comma
            let numberFormatter = NumberFormatter()
            //NumberFormatter() คือฟังก์ชันเขียนแยกไว้ด้านล่าง
            numberFormatter.numberStyle = .decimal
            let finalPriceFormatted =
                numberFormatter.string(from:
                NSNumber(value:finalPrice))

            textToUser = "ราคา \(price) ส่วนลด \(sale)% ลดแล้วคงเหลือ\(finalPriceFormatted ?? "0")"

            alertIsVisible = true
            }) {
            Text("คํานวณเลยฮ๊าฟ")
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(textIsAppropriate() ? Color.gray :
                    Color.green)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .font(.headline)
        }//end Button
        .disabled(!textIsAppropriate()) //คือปิดเป็นเท็จ คือกดได้
            
            //#######Clear
            //สั่งปิดไม่ให้ทํางาน (disable) ให้เป็นจริงหรือเป็นเท็จ
        .alert(isPresented: $alertIsVisible, content: {
            return Alert(title: Text("ผลการคํานวณ"), message:
            Text(textToUser), dismissButton:
            Alert.Button.default(
                Text("โอเคนัมเบอร์วัน"), action: {
                    clearValue() //เรียกใช้ หรือสั่งใช้งาน
                    saveTempText() //เรียกใช้ หรือสั่งใช้งาน
            }
        )) //กําหนดตั้งค่าให้กับ หน้าต่างแจ้งเตือน (alert)
    })//end .alert
            ForEach(dataHistoryArray, id: \.self) { data in Text(data)
                .font(.caption)
            }//end Button
        Spacer()
        }// end vstack
        .padding()
    }// end body
    func textIsAppropriate() -> Bool {
        if priceTextFieldText.count > 0 && saleTextFieldText.count > 0
        {
        return true
        }
        return false
    }//end func textIsAppropriate()
    func clearValue(){
        priceTextFieldText.removeAll()
        saleTextFieldText.removeAll()
        //priceTextFieldText = "" //SwiftUI
        //saleTextFieldText = "" //SwiftUI
        //saleTextFieldText.text = "" //UIKIT
        //เชื่อมโยงภายนอก
    }//end func clearValue()
    func saveTempText(){
        dataHistoryArray.append(textToUser)
    }//end func saveTempText()
}// end ContentView

//extension = ส่วนต่อขยาย
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder
        .resignFirstResponder), to: nil, from: nil, for: nil)
    }
}//end extension
extension NumberFormatter {
    static var pricing: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}//end extension

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
