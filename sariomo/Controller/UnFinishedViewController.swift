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
    
    @IBOutlet weak var detailButton: UIButton!
    
    var tankas: [Tanka] = []
    var tankaTes: [Tankalist] = []
    
    var json: JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        unFinishedTanka()
        
        tableView.reloadData()
        
    }
    
    
    
    func unFinishedTanka() {
        let api = ApiManager(path: "/NocompleteTL")
        api.request(success: {(data: Dictionary) in
            self.tankaTes = self.a(data: data)
            // self.json = JSON(data)
            
        }, fail: {(error: Error?) in
            print(error!)
        })
    }
    
    func a(data: Dictionary<String, Any>) -> [Tankalist] {
        let json = JSON(data)
        print(json)
        
        var a: [Tankalist] = []
        
        for i in 0...2 {
            let tankaid: Int = json["tankalist"][i]["tankaid"].int!
            print(tankaid)
            
            let sectionid: Int = json["tankalist"][i]["sectionid"].int!
            let phrase: [String: String] = json["tankalist"][i]["phrase"].dictionaryObject as! [String: String]
            let userid: [String: Int] = json["tankalist"][i]["userid"].dictionaryObject as! [String: Int]
            let date: [String: String] = json["tankalist"][i]["date"].dictionaryObject as! [String: String]
            let taglist: [String] = json["tankalist"][i]["taglist"].arrayObject as! [String]
            let background: String = json["tankalist"][i]["background"].string!
            let wordcolor: String = json["tankalist"][i]["wordcolor"].string!
            
            let t = Tankalist(tankaid: tankaid, sectionid: sectionid, phrase: phrase, userid: userid, date: date, taglist: taglist, background: background, wordcolor: wordcolor)
            a.append(t)
        }
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print(a)
        return a
    }
    
    @IBAction func test(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "DetailTankaShowViewController") as! DetailTankaShowViewController
        // second.tanka = tankaTes[0].phrase["1"]!
        second.t = tankaTes[sender.tag]
        self.present(second, animated: true, completion: nil)
        print(tankaTes[0].phrase)
        print("aaaaa")
        print(sender.tag)
    }
    
    
}

extension UnFinishedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tableView.deselectRow(at: indexPath, animated: true)
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
        
        print("indexPath.row: \(indexPath.row)")
        
        cell.fill(tanka: tankaTes[indexPath.row], a: indexPath.row)
        
        cell.detailButton.tag = indexPath.row
        
        
        
        return cell
    }
}
