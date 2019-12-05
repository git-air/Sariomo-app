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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
