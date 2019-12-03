//
//  BeaconViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import SwiftyGif
import TGRFramework

class BeaconViewController: UIViewController {
    
    var tgrClient: TGRClient?
    let appId: String = "293"
    let developerId: String = "89"
    let serviceId: String = "1082454069"
    let enableADID: Bool = true
    let enableNotify: Bool = true
    
    var detectionBeaconView: DetectionBeaconView!
    
    var isFirstDetection = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.detectionBeaconView.doAnimation()
        startMonitor()
    }
    
    func initView() {
        self.detectionBeaconView = DetectionBeaconView.init(frame: self.view.frame)
        self.view.addSubview(detectionBeaconView)
    }
    
    func showDetectionBeaconView(_ bool: Bool) {
        UIView.animate(withDuration: 0.6, animations: {
            self.detectionBeaconView.alpha = bool ? 1 : 0
        }, completion: { _ -> Void in
            if !bool && self.isFirstDetection {
                self.isFirstDetection = false
            }
            self.detectionBeaconView.animationBool = false
        })
    }
    
    @IBAction func tapToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}

extension BeaconViewController: TGRClientDelegate {
    
    func startMonitor() {
        let option = TGRInitOption(appId: appId, devId: developerId, serviceId: serviceId, enableADID: enableADID, enableNotify: enableNotify)
        tgrClient = TGRClient(option: option, delegate: self)
        tgrClient?.startMonitoring()
    }
    
    func didEnter(withParams params: [AnyHashable: Any]!, rssi: NSNumber) {
        self.showDetectionBeaconView(false)
    }
    
    func didExit(withParams params: [AnyHashable : Any]!, rssi: NSNumber!) {
        print("ビーコン範囲外です")
    }
    
    func didFailWith(_ errorType: TGRErrorType, error: Error!) {
        print("不明なエラーです。")
    }


}
