//
//  TestXibView.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/01.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class TestXibView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tankaLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
