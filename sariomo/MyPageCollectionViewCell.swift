//
//  MyPageCollectionViewCell.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/12/06.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class MyPageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var phraseLabel: UILabel!
    
    func fill(tanka: Tankalist, a: Int) {
        bgView.backgroundColor = MyColor(hex: tanka.background)
        
        self.phrase(tanka: tanka, i: a)
    }
    
    func phrase(tanka: Tankalist, i: Int) {
        var a = ""
        
        print(i)
        
        for j in 1...5 {
            var phrase: String = ""
            if (j == 5){
                phrase = tanka.phrase["\(j)"]!
            } else {
                phrase = tanka.phrase["\(j)"]! + "\n"
            }
            // print(phrase)
            a.append(phrase)
        }
        
        phraseLabel.text = a
        a = ""
        print("@@@@@@@@@@@@@")
        print(a)
    }
}
