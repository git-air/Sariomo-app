//
//  DetailTankaShowViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/12/04.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


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
        
        tankaView.showAnimatedSkeleton()
        tankaLabel.showAnimatedSkeleton()
        
        tagLabel.showAnimatedSkeleton()
        kukanLabel.showAnimatedSkeleton()
        
        user1Label.showAnimatedSkeleton()
        user2Label.showAnimatedSkeleton()
        user3Label.showAnimatedSkeleton()
        user4Label.showAnimatedSkeleton()
        user5Label.showAnimatedSkeleton()
        
        date1Label.showAnimatedSkeleton()
        date2Label.showAnimatedSkeleton()
        date3Label.showAnimatedSkeleton()
        date4Label.showAnimatedSkeleton()
        date5Label.showAnimatedSkeleton()

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
            self.tankaView.hideSkeleton()
            self.tankaLabel.hideSkeleton()
            
            self.tagLabel.hideSkeleton()
            self.kukanLabel.hideSkeleton()
            
            self.user1Label.hideSkeleton()
            self.user2Label.hideSkeleton()
            self.user3Label.hideSkeleton()
            self.user4Label.hideSkeleton()
            self.user5Label.hideSkeleton()
            
            self.date1Label.hideSkeleton()
            self.date2Label.hideSkeleton()
            self.date3Label.hideSkeleton()
            self.date4Label.hideSkeleton()
            self.date5Label.hideSkeleton()
            
            // self.backgroundColor = self.t.background
//            self.tankaView.backgroundColor = MyColor(hex: self.t.background)
            self.tankaView.backgroundColor = MyColor(hex: self.t.background)
            
            self.tankaLabel.text = self.t.phrase["1"]! + "\n" + self.t.phrase["2"]! + "\n" + self.t.phrase["3"]! + "\n" + self.t.phrase["4"]! + "\n" + self.t.phrase["5"]!
            
            
            self.user(userid: self.t.userid["1"]!, label: self.user1Label)
            self.user(userid: self.t.userid["2"]!, label: self.user2Label)
            self.user(userid: self.t.userid["3"]!, label: self.user3Label)
            self.user(userid: self.t.userid["4"]!, label: self.user4Label)
            self.user(userid: self.t.userid["5"]!, label: self.user5Label)
            
            self.date1Label.text = self.t.date["1"]!
            self.date2Label.text = self.t.date["2"]!
            self.date3Label.text = self.t.date["3"]!
            self.date4Label.text = self.t.date["4"]!
            self.date5Label.text = self.t.date["5"]!
        }
        
        //        userName(userid: t.userid["1"]!)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func user(userid: Int, label: UILabel) {
        let parameter = [
            "userid": userid
        ]
        let api = ApiManager(host: "", path: "/getuser", method: .post, parameters: parameter)
        api.request(success: {(data: Dictionary<String, Any>) in
            let json = JSON(data)
            DispatchQueue.main.async {
                label.text = json["username"].string!
            }
        }, fail: {(error: Error?) in
            print(error!)
        })
    }
    
    
}
