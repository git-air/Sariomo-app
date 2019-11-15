//
//  MyPageViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/13.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

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
        let a = ApiManager(host: "https://httpbin.org", path: "/post", method: .post, parameters: parameter)
        api.request(success: { (data: Dictionary) in debugPrint(data) }, fail: { (error: Error?) in print(error!) })
        a.request(success: { (data: Dictionary) in debugPrint(data) }, fail: { (error: Error?) in print(error!) })
    }
    
}
