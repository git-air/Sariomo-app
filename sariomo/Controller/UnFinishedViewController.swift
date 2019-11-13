//
//  UnFinishedViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/09.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class UnFinishedViewController: UIViewController {
    
    var theScrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        // v.backgroundColor = .gray
        return v
    }()
    
    var theStackView: UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.alignment = .leading
        v.distribution = .fillProportionally
        v.spacing = 600.0
        return v
    }()
    
    var tanka: [String] = ["""
    賑やかな
    踊り楽しむ
    夏祭り
    """,
                               """
    海外の
    声が飛び交う
    街並みに
    はなしわからぬ
    """,
                               """
    もみじ舞う
    山を脇目に
    """,
                               """
    test
    """
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        
    }
    
    func addView() {
        view.addSubview(theScrollView)
        
        // constrain it 40-pts on each side
        NSLayoutConstraint.activate([
            theScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            theScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0),
            theScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0),
            theScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0),
        ])
        
        theScrollView.addSubview(theStackView)
        
        NSLayoutConstraint.activate([
            theStackView.topAnchor.constraint(equalTo: theScrollView.topAnchor, constant: 10.0),
            theStackView.bottomAnchor.constraint(equalTo: theScrollView.bottomAnchor, constant: -10.0),
            theStackView.leadingAnchor.constraint(equalTo: theScrollView.leadingAnchor, constant: 0.0),
            theStackView.trailingAnchor.constraint(equalTo: theScrollView.trailingAnchor, constant: 0.0),
            
            // stackView width = scrollView width -40 (20-pts padding on left & right
            theStackView.widthAnchor.constraint(equalTo: theScrollView.widthAnchor, constant: 0.0),
        ])
        
        for i in 0..<4 {
            let v = UIView.fromNib() as TestXibView
            
            // v.translatesAutoresizingMaskIntoConstraints = false
            
            v.tankaLabel?.numberOfLines = 0;
            v.tankaLabel?.text = tanka[i]
            v.timeLabel?.text = time()
            v.authorLabel?.text = "User\(i)"
            
            v.imageView.image = UIImage(named: "shiden\(i)")
            v.imageView.contentMode = .scaleAspectFill
            v.imageView.clipsToBounds = true
            
            theStackView.addArrangedSubview(v)
            
        }
    }
    
    func time() -> String {
        let dt = Date()
        let dateFormatter = DateFormatter()
        
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMdd", options: 0, locale: Locale(identifier: "ja_JP"))
        
        return dateFormatter.string(from: dt)
    }
    
}
