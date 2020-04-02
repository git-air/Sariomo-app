//
//  DetailTankaViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class DetailTankaViewController: UIViewController {

    var argString = ""
    
    @IBOutlet weak var phrase1Label: UILabel!
    
    @IBOutlet weak var backgroundColorContainerView: UIView! {
        didSet {
            guard let viewController = UIStoryboard(name: "BackgroundColor", bundle: nil).instantiateInitialViewController() else { return }
            backgroundColorContainerView.frame = backgroundColorContainerViewInitFrame
            backgroundColorContainerView.addSubview(viewController.view)
        }

    }
    
    @IBOutlet weak var textColorContainerView: UIView! {
        didSet {
            guard let viewController = UIStoryboard(name: "TextColor", bundle: nil).instantiateInitialViewController() else { return }
            textColorContainerView.frame = textColorContainerViewInitFrame
            textColorContainerView.addSubview(viewController.view)
        }
    }
    
    
    private let backgroundColorContainerViewInitFrame = CGRect(x: 0, y:1000,
    width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    private let textColorContainerViewInitFrame = CGRect(x: 0, y: 1000,
    width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    private let containerViewDispFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phrase1Label.text = argString

        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            if let view = touch.view {
                transitionSlideViewController(tag: view.tag)
            }
        }
    }
    
    func transitionSlideViewController(tag: Int) {
        if tag == 100 {
            UIView.animate(withDuration: 0.3, animations: {
                self.backgroundColorContainerView.frame = self.backgroundColorContainerViewInitFrame
            })
        } else if tag == 200 {
            UIView.animate(withDuration: 0.3, animations: {
                self.textColorContainerView.frame = self.textColorContainerViewInitFrame
            })
        }
    }
    
    @IBAction func tapToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        backgroundColorContainerView.frame = backgroundColorContainerViewInitFrame
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColorContainerView.frame = self.containerViewDispFrame
        })
    }
    
    @IBAction func textColorButton(_ sender: UIButton) {
        textColorContainerView.frame = textColorContainerViewInitFrame
        UIView.animate(withDuration: 0.3, animations: {
            self.textColorContainerView.frame = self.containerViewDispFrame
        })
    }
    
    @IBAction func postTanka(_ sender: Any) {
        let parameter: [String: Any] = [
            "sectionid": 1,
            "where": 1,
            "phrase": "サリチル酸サリチル酸",
            "user": 1110,
            "date": "20191127",
            "background": "FFFFFF",
            "wordcolor": "000000"
        ]
        let api = ApiManager(host: "", path: "/addPhrase", method: .post, parameters: parameter)
        
        api.request(success: {(data:Any) in
            print(data)
        }, fail: {(error: Error?) in
            print(error!)
        })
    }
    
    
    

}
