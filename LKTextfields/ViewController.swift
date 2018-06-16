//ViewController.swift
/*
 * LKTextfields
 * Created by penumutchu.prasad@gmail.com on 16/06/18
 * Is a product created by abnboys
 * For the  in the LKTextfields
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var dobTF: UITextField!
    @IBOutlet var stsTF: StatusTextField!
    @IBOutlet var animaTF: AnimaTF!
    
    var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        dobTF.delegate = self
        animaTF.delegate = self

    }

  
    
    func pickDOB(tf: UITextField) {
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 220))
        self.datePicker.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.datePicker.datePickerMode = UIDatePickerMode.date
        dobTF.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
            
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        dobTF.inputAccessoryView = toolBar
        
    }

    // MARK:- Button Done and Cancel
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        dobTF.text = dateFormatter1.string(from: datePicker.date)
        dobTF.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        dobTF.resignFirstResponder()
    }

    @IBAction func onEditingStsTF(_ sender: StatusTextField) {
        
        if sender == stsTF {
            
            if sender.text == "" {
                sender.clearHint()
                return
            }
            
            if let text = sender.text {
                
                if text.count >= 5 {
                    sender.showCorrectHint()
                } else {
                    sender.showErrorHint()
                }
                
            }
            
        }
        
        
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == dobTF {
            self.pickDOB(tf: dobTF)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.datePicker != nil {
            self.datePicker.removeFromSuperview()
            self.datePicker = nil
        }
    }
    
    
}




















