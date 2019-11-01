//
//  TestXibView.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/01.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class TestXibView: UIView {
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
        //fatalErrorがデフォルトで入っていますが消さないとエラーになってしまうので注意してください！
    }
    func loadNib() {
        //CustomViewの部分は各自作成したXibの名前に書き換えてください
        let view = Bundle.main.loadNibNamed("TestXibView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
