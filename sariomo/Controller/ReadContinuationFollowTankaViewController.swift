//
//  readContinuationFollowTankaViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/12/05.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class ReadContinuationFollowTankaViewController: UIViewController {
    
    var t: Tankalist!
    
    var empty = 1
    
    var tf: [UITextField]! = []
    
    @IBOutlet weak var phrase1Label: UILabel!
    @IBOutlet weak var phrase2Label: UILabel!
    @IBOutlet weak var phrase3Label: UILabel!
    @IBOutlet weak var phrase4Label: UILabel!
    @IBOutlet weak var phrase5Label: UILabel!
    
    @IBOutlet weak var phrase1TextField: UITextField!
    @IBOutlet weak var phrase2TextField: UITextField!
    @IBOutlet weak var phrase3TextField: UITextField!
    @IBOutlet weak var phrase4TextField: UITextField!
    @IBOutlet weak var phrase5TextField: UITextField!
    
    @IBOutlet weak var postTankaButton: UIBarButtonItem!
    
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.titleTextAttributes = [
            .foregroundColor: MyColor.brownishGrey
        ]
        
        phrase1Label.text = t.phrase["1"]
        phrase2Label.text = t.phrase["2"]
        phrase3Label.text = t.phrase["3"]
        phrase4Label.text = t.phrase["4"]
        phrase5Label.text = t.phrase["5"]
        
        //        text(textField: phrase1TextField, phrase: t.phrase["1"]!)
        //        text(textField: phrase2TextField, phrase: t.phrase["2"]!)
        //        text(textField: phrase3TextField, phrase: t.phrase["3"]!)
        //        text(textField: phrase4TextField, phrase: t.phrase["4"]!)
        //        text(textField: phrase5TextField, phrase: t.phrase["5"]!)
        
        tf.append(phrase1TextField)
        tf.append(phrase2TextField)
        tf.append(phrase3TextField)
        tf.append(phrase4TextField)
        tf.append(phrase5TextField)
        
        postTankaButton.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationViewController.changeNotifyTextField(sender:)), name: UITextField.textDidChangeNotification, object: nil)
        
        emptyCheck()
        aaa(tanka: t)
        
    }
    
    @objc public func changeNotifyTextField (sender: NSNotification) {
        guard let textView = sender.object as? UITextField else {
            return
        }
        if textView.text != nil {
            postTankaButton.isEnabled = textView.text != ""
        }
    }
    
    func text(textField: UITextField, phrase: String) {
        textField.placeholder = phrase
        textField.borderStyle = .none
        if(phrase != "") {
            textField.isUserInteractionEnabled = false
        }
        // textField.isEdita
        // textField.addBorderBottom(height: 1.0, color: MyColor.brownishGrey)
    }
    
    func emptyCheck() {
        var isEmptyFirst = true
        for i in 1...5 {
            if(t.phrase["\(i)"] == "") {
                if(isEmptyFirst) {
                    empty = i
                    isEmptyFirst = false
                }
            }
        }
        print("empty: \(empty)")
    }
    
    func aaa(tanka: Tankalist) {
        var isEmptyFirst = true
        for i in 0...4 {
            tf[i].placeholder = t.phrase["\(i+1)"]
            tf[i].borderStyle = .none
            tf[i].isUserInteractionEnabled = false
            
            if(t.phrase["\(i+1)"] == "") {
                if (isEmptyFirst) {
                    tf[i].isUserInteractionEnabled = true
                    tf[i].addBorderBottom(height: 1.0, color: MyColor.tomato)
                    isEmptyFirst = false
                }
            }
        }
    }
    
    func postTanka(phrase: String) {
        let tankaid = t.tankaid
        let user = Int.random(in: 1...20)
        let date = "20191206"
        let parameter: [String: Any] = [
            "tankaid": tankaid,
            "where": empty,
            "phrase": phrase,
            "user": user,
            "date": date
        ]
        
        print("parameter: \(parameter)")
        
        let api = ApiManager(host: "***REMOVED***", path: "/addPhrase", method: .post, parameters: parameter)
        api.request(success: {(data: Any) in
            print("addPhrase: \(data)")
        }, fail: {(error: Error?) in
            print(error!)
        })
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)    }
    
    
    @IBAction func postContinueTanka(_ sender: Any) {
        let phrase = tf[empty-1].text!
        postTanka(phrase: phrase)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

