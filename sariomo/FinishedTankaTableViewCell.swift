//
//  FinishedTankaTableViewCell.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class FinishedTankaTableViewCell: UITableViewCell {
        
    @IBOutlet weak var finishedPhotoImageView: UIImageView!
    
    @IBOutlet weak var finishedTankaLabel: UILabel!
    @IBOutlet weak var finishedDateLabel: UILabel!
    @IBOutlet weak var finishedUserLabel: UILabel!
    
    @IBOutlet weak var finishedDetailLabel: UIButton!
    
    var json:JSON = []
    
    func fill(tanka: Tankalist, a: Int) {
        finishedPhotoImageView.image = UIImage(named: "shiden1")
        finishedPhotoImageView.alpha = 0.4
        
        finishedDateLabel.text = self.time()
        
        finishedUserLabel.text = String(tanka.userid["1"]!)
        
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
            let phrase = tanka.phrase["\(j)"]! + "\n"
            // print(phrase)
            a.append(phrase)
        }
        
        finishedTankaLabel.text = a
        a = ""
        print("@@@@@@@@@@@@@")
        print(a)
    }
    
    func json(data: Dictionary<String, Any>) {
        self.json = JSON(data)
    }
    
    
}
