//
//  UnFinishedViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/09.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyJSON
import SkeletonView

class UnFinishedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    // var tankas: [Tanka] = []
    var tankaTes: [Tankalist] = []
    
    var json: JSON = []
    
    var users:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //        tableView.isSkeletonable = true
        
        unFinishedTanka()
        
        tableView.refreshControl = refreshControl
        tableView.refreshControl?.addTarget(self, action:
            #selector(handleRefreshControl),
                                            for: .valueChanged)
        
        tableView.reloadData()
        
    }
    
    @objc func handleRefreshControl() {
        // Update your content…
        
        unFinishedTanka()
        tableView.reloadData()
        
        // Dismiss the refresh control.
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
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
    
//    func test() -> String{
//        let dispatchGroup = DispatchGroup()
//        let dispatchQueue = DispatchQueue(label: "queue", attributes: .concurrent)
//
//        let parameter = [
//            "userid": 9999
//        ]
//
//        dispatchGroup.enter()
//        dispatchQueue.async(group: dispatchGroup) {
//            let api = ApiManager(host: "***REMOVED***", path: "/getuser", method: .post, parameters: parameter)
//            api.request(success: {(data: Any) in
//                aiu = JSON(data)
//            }, fail: {(error: Error?) in
//                print(error!)
//            })
//            dispatchGroup.leave()
//        }
//        dispatchGroup.notify(queue: .main) {
//            // username = aiu["username"].string!
//            // self.userLabel.text = aiu["username"].string!
//            print("All Process Done!")
//        }
//        return username
//        // username = aiu["username"].string!
//
//    }
    
    func a(data: Dictionary<String, Any>) -> [Tankalist] {
        let json = JSON(data)
        let count = json["tankalist"].count
        print(json)
        
        var a: [Tankalist] = []
        
        for i in 0...count-1 {
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
            // t.date["1"] = test()
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
    
    @IBAction func readContinuationUnfinishedTanka(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let next = storyboard.instantiateViewController(withIdentifier: "ReadContinuationUnFinishedTankaViewController") as! ReadContinuationUnFinishedTankaViewController
        next.t = tankaTes[sender.tag]
        self.present(next, animated:  true, completion: nil)
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
        
        // let text = self.test()
        
        
        cell.fill(tanka: self.tankaTes[indexPath.row], a: indexPath.row)
        
        
        
        cell.detailButton.tag = indexPath.row
        cell.readContinueButton.tag = indexPath.row
        
        
        
        return cell
    }
}
