//
//  MyPageViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/13.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyPageViewController: UIViewController {
    
    let parameter: [String: Any] = [
        "phrase1": "aaa",
        "phrase2": "iii",
        "phrase3": "uuu",
        "phrase4": "eee",
        "phrase5": "ooo"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("******MyPage*******")
        
        let api = ApiManager(path: "/timeline")
        api.request(success: { (data: Dictionary) in print(data) }, fail: { (error: Error?) in print(error!) })
        
        func displayLabel(str: String, label: UILabel) {
            print(str)
            label.text = str
        }
    }
    
}
