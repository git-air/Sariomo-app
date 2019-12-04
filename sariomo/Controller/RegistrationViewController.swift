//
//  RegistrationViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationViewController.changeNotifyTextField(sender:)), name: UITextField.textDidChangeNotification, object: nil)
        
        textField.placeholder = "NAME"
        textField.borderStyle = .none
        textField.addBorderBottom(height: 1.0, color: UIColor.lightGray)
    }
    
    @objc public func changeNotifyTextField (sender: NSNotification) {
        guard let textView = sender.object as? UITextField else {
            return
        }
        if textView.text != nil {
            signUpButton.isEnabled = textView.text != ""
        }
    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
        let name = textField.text!
        print("nama: \(name)")
        let parameter = [
            "username": name
        ]
        let api = ApiManager(host: "***REMOVED***", path: "/adduser", method: .post, parameters: parameter)
        
        api.request(success: {(data:Any) in
            print("Registration: \(data)")
        }, fail: {(error: Error?) in
            print(error!)
        })
        
    }
    
    
}

extension UITextField {
    func addBorderBottom(height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height - height, width: self.frame.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}


