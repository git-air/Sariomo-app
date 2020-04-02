//
//  BeaconViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyGif

class BeaconViewController: UIViewController {
    
    // public var postTanka: Tankalist!
    
    public var sectionId: Int = 5
    public var iti: Int = 1
    public var phrase: String = ""
    public var user: Int = 0
    public var date: String = "20191206"
    public var background: String = ""
    public var wordcolor: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // postTanka()
    }
    
    func postTanka() {
        let parameter: [String: Any] = [
            "sectionid": sectionId,
            "where": iti,
            "phrase": phrase,
            "user": user,
            "date": date,
            "background": background,
            "wordcolor": wordcolor
        ]
        let api = ApiManager(host: "", path: "/addPhrase", method: .post, parameters: parameter)
        api.request(success: {(data: Any) in
            print("data: \(data)")
        }, fail: {(error: Error?) in
            print(error!)
        })
    }
    
    
}

//extension BeaconViewController: TGRClientDelegate {
//
//    func startMonitor() {
//        let option = TGRInitOption(appId: appId, devId: developerId, serviceId: serviceId, enableADID: enableADID, enableNotify: enableNotify)
//        tgrClient = TGRClient(option: option, delegate: self)
//        tgrClient?.startMonitoring()
//    }
//
//    func didEnter(withParams params: [AnyHashable: Any]!, rssi: NSNumber) {
//        self.showDetectionBeaconView(false)
//    }
//
//    func didExit(withParams params: [AnyHashable : Any]!, rssi: NSNumber!) {
//        print("ビーコン範囲外です")
//    }
//
//    func didFailWith(_ errorType: TGRErrorType, error: Error!) {
//        print("不明なエラーです。")
//    }
//
//
//}
