//
//  FollowTankaTableViewCell.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/12/04.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class FollowTankaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var tankaLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var detailButton: UIButton!
    
    @IBOutlet weak var readContinueButton: UIButton!
    
    var json: JSON = []
    
    func fill(tanka: Tankalist, a: Int) {
        photoImageView.image = UIImage(named: "shiden\(a)")
        photoImageView.alpha = 0.4
        
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
            let phrase = tanka.phrase["\(j)"]! + "\n"
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
}
