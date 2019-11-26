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
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var tankaLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    var json:JSON = []
    
    func fill(tanka: Tankalist) {
        photoImageView.image = UIImage(named: "shiden1")
        photoImageView.alpha = 0.4
        
        let tankaApi = ApiManager(path: "/timeline")
        tankaApi.request(success: {(data:Dictionary) in
            self.json(data: data)
            self.phrase()
        }, fail: {(error: Error?) in
            print(error!)}
        )
        
        // tankaLabel.text = tanka.phrase1 + "\n" + tanka.phrase2 + "\n" + tanka.phrase3 + "\n" + tanka.phrase4 + "\n" + tanka.phrase5
        dateLabel.text = self.time()
        
        userLabel.text = String(tanka.userid["1"]!)
        
    }
    
    func time() -> String {
        let dt = Date()
        let dateFormatter = DateFormatter()
        
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMdd", options: 0, locale: Locale(identifier: "ja_JP"))
        
        return dateFormatter.string(from: dt)
    }
    
    func phrase() {
        var a = ""
        
        for j in 1...5 {
            let phrase = json["tankalist"][0]["phrase"]["\(j)"].string! + "\n"
            // print(phrase)
            a.append(phrase)
        }
        tankaLabel.text = a
        print("@@@@@@@@@@@@@")
        print(a)
    }
    
    func json(data: Dictionary<String, Any>) {
        self.json = JSON(data)
    }
    
    
}
