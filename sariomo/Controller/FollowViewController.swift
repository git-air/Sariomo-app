//
//  FollowViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/06.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class FollowViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(theScrollView)
        
        // constrain it 40-pts on each side
        NSLayoutConstraint.activate([
            theScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            theScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0),
            theScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0),
            theScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0),
            // theScrollView.heightAnchor.constraint(equalToConstant: 3000.0)
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
        
        for i in 0..<3 {
            let v = UIView.fromNib() as TestXibView
            
            // v.translatesAutoresizingMaskIntoConstraints = false
            
            v.tankaLabel?.text = "tanka: \(i)"
            v.timeLabel?.text = time()
            v.authorLabel?.text = "User\(i)"
            
            v.imageView.image = UIImage(named: "Image\(i)")
            // v.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 400)
            v.imageView.contentMode = .scaleAspectFill
            v.imageView.clipsToBounds = true
            
            theStackView.addArrangedSubview(v)
            
        }
        
        //        // create an instance of SingleEvent from its xib/nib
        //        let v = UIView.fromNib() as TestXibView
        //
        //        // we're going to use auto-layout & constraints
        //        v.translatesAutoresizingMaskIntoConstraints = false
        //
        //        // set the text of the labels
        //        v.tankaLabel?.text = "aaaaaaaa"
        //        v.timeLabel?.text = time()
        //        v.authorLabel?.text = "AIRU"
        //
        //        // set the image
        //        v.imageView.image = UIImage(named: "hakodate_shiden")
        //
        //        // add the SingleEvent view
        //        view.addSubview(v)
        //
        //        // constrain it 200 x 200, centered X & Y
        //        //        NSLayoutConstraint.activate([
        //        //            v.widthAnchor.constraint(equalToConstant: 10.0),
        //        //            v.heightAnchor.constraint(equalToConstant: 10.0),
        //        //            v.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //        //            v.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        //        //            ])
        //        v.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true
        //        v.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        //        // v.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        
    }
    
    func time() -> String {
        let dt = Date()
        let dateFormatter = DateFormatter()
        
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMdd", options: 0, locale: Locale(identifier: "ja_JP"))
        
        return dateFormatter.string(from: dt)
    }
    
}
