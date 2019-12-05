//
//  FinishedViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/09.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyJSON

class FinishedViewController: UIViewController {
    
    @IBOutlet weak var finishedTableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    var tankas: [Tankalist] = []
    
    var json: JSON = []
    
    var users: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishedTableView.delegate = self
        finishedTableView.dataSource = self
        
        FinishedTanka()
        
        finishedTableView.refreshControl = refreshControl
        finishedTableView.refreshControl?.addTarget(self, action:
            #selector(handleRefreshControl),
                                            for: .valueChanged)
        
        finishedTableView.reloadData()
        
    }
    
    @objc func handleRefreshControl() {
        // Update your content…
        
        FinishedTanka()
        finishedTableView.reloadData()
        
        // Dismiss the refresh control.
        DispatchQueue.main.async {
            self.finishedTableView.refreshControl?.endRefreshing()
        }
    }
    
    func FinishedTanka() {
        let api = ApiManager(path: "/completeTL")
        api.request(success: {(data: Dictionary) in
            print("deta: \(data)")
            self.tankas = self.a(data: data)
            // self.json = JSON(data)
            
        }, fail: {(error: Error?) in
            print(error!)
        })
    }
    
    func a(data: Dictionary<String, Any>) -> [Tankalist] {
        let json = JSON(data)
        print(json)
        
        var a: [Tankalist] = []
        print("json: \(json)")
        
        for i in 0...1 {
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
    
    @IBAction func toDetailTanka(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "DetailFinishedTankaViewController") as! DetailFinishedTankaViewController
        second.t = tankas[sender.tag]
        self.present(second, animated: true, completion: nil)
        print(tankas[0].phrase)
        print("aaaaa")
        print(sender.tag)
    }
}

extension FinishedViewController: UITableViewDelegate {
    
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

extension FinishedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tankas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinishedTankaTableViewCell") as! FinishedTankaTableViewCell
        
        print("indexPath.row: \(indexPath.row)")
        
        cell.fill(tanka: tankas[indexPath.row], a: indexPath.row)
        cell.detailButton.tag = indexPath.row
        
        
        
        return cell
    }
}
