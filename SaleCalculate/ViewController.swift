//
//  ViewController.swift
//  SaleCalculate631310081
//
//  Created by surawut binmamud on 28/8/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    //global
    @IBOutlet weak var inputPriceTextField: UITextField!
    @IBOutlet weak var inputSaleTextField: UITextField!
    //global
    @IBOutlet weak var showPriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showPriceLabel.text = ""
        setupTextFields() //function call
        let tap = UITapGestureRecognizer(target: view, action:
        #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    @IBAction func setPriceBt(_ sender: UIButton) {
    //inputPriceTextField.text = "1590"
    inputPriceTextField.text = sender.currentTitle
    }
    @IBAction func setSaleBt(_ sender: UIButton) {
    //inputSaleTextField.text = "70"
    inputSaleTextField.text = sender.currentTitle
    }
    
    @IBAction func topupSaleBt(_ sender: UIButton) {
    //Step process
    //1. ดึงค่าเดิมมา
    //2. แปลงค่าให้เป็นตัวเลข
    //3. บวกค่าเพิ่มไป
    //4. ใส่ค่ากลับลงไปใน textField แสดงผล
    if let inputSale = inputSaleTextField.text {
    var myFloatSale = (inputSale as NSString).floatValue
    myFloatSale = myFloatSale+5
    if(myFloatSale>=100){
        myFloatSale = 100
        }//end if >=100
        inputSaleTextField.text = "\(myFloatSale)"
        }//end if let inputSale
    }//end func topupSaleBt

    @IBAction func okeyBt(_ sender: Any) {
        //local
//        print(inputPriceTextField.text)
//        print(inputSaleTextField.text)
//        showPriceLabel.text = inputPriceTextField.text ?? "0"
//        showPriceLabel.text! += inputSaleTextField.text ?? "0"
        
        if let inputPrice = inputPriceTextField.text, let inputSale =

            inputSaleTextField.text{
            //แปลงค่า เพื่อคํานวณ
            let myFloatPrice = (inputPrice as NSString).floatValue
            print("ค่าหลังจากแปลงเป็น float แล้ว คือ \(myFloatPrice)")
            let myFloatSale = (inputSale as NSString).floatValue
            //เข้าสูตรการคํานวณ
            //ราคาจริง - ราคาที่เป็นส่วนลดตามเปอร์เซ็น
            //ราคาที่เป็นส่วนลดตามเปอร์เซ็น คือ ราคาจริง*เลขเปอร์เซ็น/100
            if myFloatPrice>0 && myFloatSale>0 {
            let finalPrice = myFloatPrice - (myFloatPrice*myFloatSale/100)
            print("ราคาสุดท้าย (ลดแล้ว) คือ \(finalPrice)")
            showPriceLabel.text = "ราคาสุดท้าย (ลดแล้ว) คือ\(finalPrice)"
            }else{
            showPriceLabel.text = "ไม่สามารถคํานวณได้เนื่องจากราคาเป็น 0 หรือราคาติดลบ"
            }//end else
        }//end if let inputPrice
    }//end func okayBt
    
    //เกี่ยวกับแป้นพิมพ์
    func setupTextFields() {
    let toolbar = UIToolbar()
    let flexSpace = UIBarButtonItem(barButtonSystemItem:

    .flexibleSpace, target: nil, action: nil)

    let doneButton = UIBarButtonItem(title: "เสร็จแล้ว โดย 081",

    style: .done,target: self, action:
    #selector(doneButtonTapped))

    toolbar.setItems([flexSpace, doneButton], animated: true)
    toolbar.sizeToFit()
    inputPriceTextField.inputAccessoryView = toolbar
    inputSaleTextField.inputAccessoryView = toolbar
    }//end func setupTextFields
    //เกี่ยวกับการเปิด-ปิดแป้นพิมพ์
    @objc func doneButtonTapped() {
    view.endEditing(true)
    } //end @objc func doneButtonTapped
    
}

