//
//  UnFinishedViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/09.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyJSON

class UnFinishedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tankas: [Tanka] = []
    var tankaTes: [Tankalist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let tanka = Tanka(photo: "shiden1", phrase1: "aaaaa", phrase2: "iiiiii", phrase3: "uuuuuu", phrase4: "eeeeee", phrase5: "oooooooo", date: "19.11.26", user: "AIRU")
        
        let tankas = [tanka]
        self.tankas = tankas
        
        unFinishedTanka()
        
        tableView.reloadData()
        
    }
    
    func unFinishedTanka() {
        let api = ApiManager(path: "/NocompleteTL")
        api.request(success: {(data: Dictionary) in
            self.tankaTes = [self.a(data: data)]
            
        }, fail: {(error: Error?) in
            print(error!)
        })
    }
    
    func a(data: Dictionary<String, Any>) -> Tankalist {
        let json = JSON(data)
        print(json)
        
        let tankaid: Int = json["tankalist"][0]["tankaid"].int!
        print(tankaid)
        
        let sectionid: Int = json["tankalist"][0]["sectionid"].int!
        let phrase: [String: String] = json["tankalist"][0]["phrase"].dictionaryObject as! [String: String]
        let userid: [String: Int] = json["tankalist"][0]["userid"].dictionaryObject as! [String: Int]
        let date: [String: String] = json["tankalist"][0]["date"].dictionaryObject as! [String: String]
        let taglist: [String] = json["tankalist"][0]["taglist"].arrayObject as! [String]
        let background: String = json["tankalist"][0]["background"].string!
        let wordcolor: String = json["tankalist"][0]["wordcolor"].string!
        
        let t = Tankalist(tankaid: tankaid, sectionid: sectionid, phrase: phrase, userid: userid, date: date, taglist: taglist, background: background, wordcolor: wordcolor)
        
        return t
    }
    
}

extension UnFinishedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セルをタップ")
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension UnFinishedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tankaTes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TankaTableViewCell") as! TankaTableViewCell
        
        cell.fill(tanka: tankaTes[indexPath.row])
        
        return cell
    }
}
