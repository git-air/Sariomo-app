//
//  TankaTableViewCell.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/26.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class TankaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var tankaLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    @IBOutlet weak var readContinueButton: UIButton!
    
    var json:JSON = []
    
    func fill(tanka: Tankalist, a: Int) {
        bgView.backgroundColor = MyColor(hex: tanka.background)
        
        dateLabel.text = self.time()
        
        userLabel.text = String(tanka.userid["1"]!)
        // test()
        
        self.phrase(tanka: tanka, i: a)
        
    }
    
    
    
    
    func time() -> String {
        let dt = Date()
        let dateFormatter = DateFormatter()
        
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMdd", options: 0, locale: Locale(identifier: "ja_JP"))
        
        return dateFormatter.string(from: dt)
    }
    
    func phrase(tanka: Tankalist, i: Int) {
        var a = ""
        
        print(i)
        
        for j in 1...5 {
            var phrase: String = ""
            if (j == 5){
                phrase = tanka.phrase["\(j)"]!
            } else {
                phrase = tanka.phrase["\(j)"]! + "\n"
            }
            // print(phrase)
            a.append(phrase)
        }
        
        tankaLabel.text = a
        a = ""
        print("@@@@@@@@@@@@@")
        print(a)
    }
    
    func json(data: Dictionary<String, Any>) {
        self.json = JSON(data)
    }
    
    @IBAction func test(_ sender: Any) {
        // self.performSegue(withIdentifier: "toTest", sender: nil)
        print("aaaaaaaaa")
    }
    
    
    
}
