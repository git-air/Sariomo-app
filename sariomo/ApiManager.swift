//
//  ApiManager.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/13.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import Foundation
import Alamofire

// private let host = ""

struct ApiManager {
    let host: String
    let url: String
    let method: HTTPMethod
    let parameters: Parameters
    
    init(host: String = "", path: String, method: HTTPMethod = .get, parameters: Parameters = [:]) {
        self.method = method
        self.parameters = parameters
        self.host = host
        url = host + path
    }
    
    func request(success: @escaping (_ data: Dictionary<String, Any>)-> Void, fail: @escaping (_ error: Error?)-> Void) {
        
        let semaphore = DispatchSemaphore(value: 0)
        let queue = DispatchQueue.global(qos: .utility)
        
        if (method == .post) {
            print("postgayobareta")
            Alamofire.request(self.url, method: self.method, parameters: self.parameters, encoding: JSONEncoding.default).responseJSON(queue: queue) { response in
                if response.result.isSuccess {
                    success(response.result.value as! Dictionary)
                }else{
                    fail(response.result.error)
            }
                semaphore.signal()
            }
            semaphore.wait()
        } else {
            print("getgayobareta")
            Alamofire.request(url, method: method, parameters: parameters).responseJSON(queue: queue) { response in
                if response.result.isSuccess {
                    success(response.result.value as! Dictionary)
                }else{
                    fail(response.result.error)
                }
                semaphore.signal()
            }
            semaphore.wait()
        }
    }
}
