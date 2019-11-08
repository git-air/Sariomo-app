//
//  SearchElementView.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/08.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class SearchElementView: UIView {
    
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var searchImage: UIImageView!
    
}

extension UIView {
    class func ffromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
