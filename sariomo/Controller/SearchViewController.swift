//
//  SearchViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/08.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    let label: [String] = ["夏", "花火", "未来大", "函館駅", "海"]
    let image: [String] = ["summer", "hanabi", "fun_university", "station", "sea"]
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var theScrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        // v.backgroundColor = MyColor.tomato
        return v
    }()
    
    var theStackView: UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.alignment = .fill
        v.distribution = .fillProportionally
        v.spacing = 120.0
        return v
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(theScrollView)
        
        // constrain it 40-pts on each side
        NSLayoutConstraint.activate([
            theScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80.0),
            theScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40.0),
            theScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0),
            theScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0),
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
        
        for i in 0..<5 {
            let v = UIView.ffromNib() as SearchElementView
            
            // v.translatesAutoresizingMaskIntoConstraints = false
            
            v.searchLabel?.text = " # \(label[i])"
            // v.searchLabel?.textAlignment = .center
            
            v.searchImage.image = UIImage(named: image[i])
            v.searchImage.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100)
            v.searchImage.contentMode = .scaleAspectFill
            v.searchImage.clipsToBounds = true
            v.searchImage.alpha = 0.4
            
            theStackView.addArrangedSubview(v)
            
        }
    }
    
}
