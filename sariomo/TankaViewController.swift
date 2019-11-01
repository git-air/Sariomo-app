//
//  TankaViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/10/28.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TankaViewController: UIViewController {
    
    @IBOutlet weak var phrase1TextField: UITextField!
    @IBOutlet weak var phrase2TextField: UITextField!
    @IBOutlet weak var phrase3TextField: UITextField!
    @IBOutlet weak var phrase4TextField: UITextField!
    @IBOutlet weak var phrase5TextField: UITextField!
    
    @IBOutlet weak var phrase1Label: UILabel!
    @IBOutlet weak var phrase2Label: UILabel!
    @IBOutlet weak var phrase3Label: UILabel!
    @IBOutlet weak var phrase4Label: UILabel!
    @IBOutlet weak var phrase5Label: UILabel!
    
    var phrase1: String = "a"
    var phrase2: String = "i"
    var phrase3: String = "u"
    var phrase4: String = "e"
    var phrase5: String = "o"
    
    let postURL = "https://httpbin.org/post"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func postTap(_ sender: Any) {
        phrase1 = phrase1TextField.text!
        phrase2 = phrase2TextField.text!
        phrase3 = phrase3TextField.text!
        phrase4 = phrase4TextField.text!
        phrase5 = phrase5TextField.text!
        
        let parametars: [String: Any] = [
            "phrase1": phrase1,
            "phrase2": phrase2,
            "phrase3": phrase3,
            "phrase4": phrase4,
            "phrase5": phrase5
        ]
        
        postRequest(parameters: parametars)
    }
    
    func postRequest(parameters: [String: Any]) {
        Alamofire.request(postURL,
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("success")
                    print(value)
                    
                    let json = JSON(value)
                    self.displayLabel(str: json["json"]["phrase1"].string!, label: self.phrase1Label)
                    self.displayLabel(str: json["json"]["phrase2"].string!, label: self.phrase2Label)
                    self.displayLabel(str: json["json"]["phrase3"].string!, label: self.phrase3Label)
                    self.displayLabel(str: json["json"]["phrase4"].string!, label: self.phrase4Label)
                    self.displayLabel(str: json["json"]["phrase5"].string!, label: self.phrase5Label)
                case .failure(let error):
                    print("failure")
                    print(error)
                }
        }
    }
    
    func displayLabel(str: String, label: UILabel) {
        print(str)
        label.text = str
    }
    
    
}
