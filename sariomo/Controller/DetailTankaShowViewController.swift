//
//  DetailTankaShowViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/12/04.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailTankaShowViewController: UIViewController {
    
    var tanka = ""
    
    var backgroundColor = ""
    
    var tag = ""
    var kukan = ""
    
    var user1 = ""
    var user2 = ""
    var user3 = ""
    var user4 = ""
    var user5 = ""
    
    var date1 = ""
    var date2 = ""
    var date3 = ""
    var date4 = ""
    var date5 = ""
    
    var t: Tankalist!
    
    @IBOutlet weak var tankaView: UIView!
    
    @IBOutlet weak var tankaLabel: UILabel!
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var kukanLabel: UILabel!
    
    @IBOutlet weak var user1Label: UILabel!
    @IBOutlet weak var user2Label: UILabel!
    @IBOutlet weak var user3Label: UILabel!
    @IBOutlet weak var user4Label: UILabel!
    @IBOutlet weak var user5Label: UILabel!
    
    @IBOutlet weak var date1Label: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    @IBOutlet weak var date3Label: UILabel!
    @IBOutlet weak var date4Label: UILabel!
    @IBOutlet weak var date5Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColor = t.background
        
        tankaView.backgroundColor = MyColor(hex: backgroundColor)
        
        tankaLabel.text = t.phrase["1"]!
        
        user1Label.text = String(t.userid["1"]!)
        user2Label.text = String(t.userid["2"]!)
        user3Label.text = String(t.userid["3"]!)
        user4Label.text = String(t.userid["4"]!)
        user5Label.text = String(t.userid["5"]!)
        
        date1Label.text = t.date["1"]!
        date2Label.text = t.date["2"]!
        date3Label.text = t.date["3"]!
        date4Label.text = t.date["4"]!
        date5Label.text = t.date["5"]!
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func userName(userid: Int) -> String{
        var username: String = ""
        let parameter = [
            "body": [
                "userid": userid
            ]
        ]
        var json: JSON
//        let api = ApiManager(host: "http://34.85.89:8080", path: "/getuser", method: .post, parameters: parameter)
//        api.request(success: { (date:Any) in
//            json = JSON(date)
//        }, fail: {(error: Error?) in
//            print(error!)
//        })
//        username = json["username"].string!
        return username
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
