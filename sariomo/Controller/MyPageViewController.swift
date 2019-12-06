//
//  MyPageViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/13.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var myPageCollectionView: UICollectionView!
    
    var tankas: [Tankalist] = []
    
    var json: JSON = []
    
    var users: [String] = []
    
    // レイアウト設定　UIEdgeInsets については下記の参考図を参照。
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 2.0, bottom: 2.0, right: 2.0)
    // 1行あたりのアイテム数
    let itemsPerRow: CGFloat = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPageCollectionView.delegate = self
        myPageCollectionView.dataSource = self
        
        userTanka()
        
        myPageCollectionView.reloadData()
        
    }
    
    func userTanka() {
        let parameter = [
            "userid": 5
        ]
        let api = ApiManager(host: "***REMOVED***", path: "/getmytanka", method: .post, parameters: parameter)
        api.request(success: {(data: Dictionary) in
            self.tankas = self.a(data: data)
        }, fail: {(error: Error?) in
            print(error!)
        })
    }
    
    func a(data: Dictionary<String, Any>) -> [Tankalist] {
        let json = JSON(data)
        let count = json["tankalist"].count
        print("json[\"tankalist\"].count: \(json["tankalist"].count)")
        print(type(of: count))
        
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
        
        a.shuffle()
        
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print(a)
        return a
    }
    
    
    
}

extension MyPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // スタンプが押された時の処理を書く
    }
}

extension MyPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tankas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyPageCollectionViewCell
        
        cell.fill(tanka: self.tankas[indexPath.row], a: indexPath.row)
//        if let label = cell.contentView.viewWithTag(1) as? UILabel {
//            // CollectionViewCellのUILabelを取得し、絵文字をに代入する
//            let text = UnicodeScalar(Int(self.stamps[indexPath.row], radix: 16)!)
//            label.text = text?.description
//        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // let cellSize:CGFloat = self.view.bounds.width/2 - 4
        return CGSize(width: 155, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // セルの行間の設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}

