//
//  DetailTankaViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class DetailTankaViewController: UIViewController {

    public var argString = ""
    
    @IBOutlet weak var phrase1Label: UILabel!
    @IBOutlet weak var phraseView: UIView!
    
    
    @IBOutlet weak var textColorPaletteView: UIView!
    @IBOutlet weak var backgroundColorPaletteView: UIView!
    
    
    
    
    
//    @IBOutlet weak var backgroundColorContainerView: UIView! {
//        didSet {
//            guard let viewController = UIStoryboard(name: "BackgroundColor", bundle: nil).instantiateInitialViewController() else { return }
//            backgroundColorContainerView.frame = backgroundColorContainerViewInitFrame
//            backgroundColorContainerView.addSubview(viewController.view)
//        }
//
//    }
    
//    @IBOutlet weak var textColorContainerView: UIView! {
//        didSet {
//            guard let viewController = UIStoryboard(name: "TextColor", bundle: nil).instantiateInitialViewController() else { return }
//            textColorContainerView.frame = textColorContainerViewInitFrame
//            textColorContainerView.addSubview(viewController.view)
//        }
//    }
    
    
    private let backgroundColorContainerViewInitFrame = CGRect(x: 0, y:1000,
    width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    private let textColorContainerViewInitFrame = CGRect(x: 0, y: 1000,
    width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    private let containerViewDispFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phrase1Label.text = argString
        
        textColorPaletteView.isHidden = true
        backgroundColorPaletteView.isHidden = true
        
        // textColorView.isHidden = true

        // Do any additional setup after loading the view.
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        for touch in touches {
//            if let view = touch.view {
//                transitionSlideViewController(tag: view.tag)
//            }
//        }
//    }
    
//    func transitionSlideViewController(tag: Int) {
//        if tag == 100 {
//            UIView.animate(withDuration: 0.3, animations: {
//                self.backgroundColorContainerView.frame = self.backgroundColorContainerViewInitFrame
//            })
//        } else if tag == 200 {
//            UIView.animate(withDuration: 0.3, animations: {
//                self.textColorContainerView.frame = self.textColorContainerViewInitFrame
//            })
//        }
//    }
    
    @IBAction func tapToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
//        backgroundColorContainerView.frame = backgroundColorContainerViewInitFrame
//        UIView.animate(withDuration: 0.3, animations: {
//            self.backgroundColorContainerView.frame = self.containerViewDispFrame
//        })
//    }
    
//    @IBAction func textColorButton(_ sender: UIButton) {
//        textColorContainerView.frame = textColorContainerViewInitFrame
//        UIView.animate(withDuration: 0.3, animations: {
//            self.textColorContainerView.frame = self.containerViewDispFrame
//        })
//        // textColorView.isHidden = false
//    }
    
//    @IBAction func postTanka(_ sender: Any) {
//        let parameter: [String: Any] = [
//            "sectionid": 1,
//            "where": 1,
//            "phrase": "サリチル酸サリチル酸",
//            "user": 1110,
//            "date": "20191127",
//            "background": "FFFFFF",
//            "wordcolor": "000000"
//        ]
//        let api = ApiManager(host: "", path: "/addPhrase", method: .post, parameters: parameter)
//        
//        api.request(success: {(data:Any) in
//            print("success")
//            print(data)
//        }, fail: {(error: Error?) in
//            print("fail")
//            print(error!)
//        })
//    }
    
    @IBAction func textColorButton(_ sender: Any) {
        textColorPaletteView.isHidden = false
    }
    
    @IBAction func backgroundColorButton(_ sender: Any) {
        backgroundColorPaletteView.isHidden = false
    }
    
    
    @IBAction func textColorChangeFinished(_ sender: Any) {
        textColorPaletteView.isHidden = true
    }
    
    @IBAction func textColorChangeCancel(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 1.0)
        textColorPaletteView.isHidden = true
    }
    
    @IBAction func bgColorChangeFinished(_ sender: Any) {
        backgroundColorPaletteView.isHidden = true
    }
    
    @IBAction func bgColorChangeCancel(_ sender: Any) {
        phraseView.backgroundColor = MyColor.white
        backgroundColorPaletteView.isHidden = true
    }
    
    
    
    @IBAction func textColorChange0(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 1.0)
    }
    
    @IBAction func textColorChange68(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 68, green: 68, blue: 68, alpha: 1.0)
    }
    
    @IBAction func textColorChange102(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 102, green: 102, blue: 102, alpha: 1.0)
    }
    
    @IBAction func textColorChange136(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 136, green: 136, blue: 136, alpha: 1.0)
    }
    
    @IBAction func textColorChange170(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 170, green: 170, blue: 170, alpha: 1.0)
    }
    
    @IBAction func textColorChange204(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 204, green: 204, blue: 204, alpha: 1.0)
    }
    
    @IBAction func textColorChange238(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 238, green: 238, blue: 238, alpha: 1.0)
    }
    
    @IBAction func textColorChange255(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 255, green: 255, blue: 255, alpha: 1.0)
    }
    
    @IBAction func bgColorPaleSalmon(_ sender: Any) {
        phraseView.backgroundColor = MyColor.paleSalmon
    }
    
    @IBAction func bgColorPaleMauve(_ sender: Any) {
        phraseView.backgroundColor = MyColor.paleMauve
    }
    
    @IBAction func bgColorPaleLilac(_ sender: Any) {
        phraseView.backgroundColor = MyColor.paleLilac
    }
    
    @IBAction func bgColorGreyishBrown(_ sender: Any) {
        phraseView.backgroundColor = MyColor.greyishBrown
    }
    
    @IBAction func bgColorCream(_ sender: Any) {
        phraseView.backgroundColor = MyColor.cream
    }
    
    @IBAction func bgColorLightSkyBlue(_ sender: Any) {
        phraseView.backgroundColor = MyColor.lightSkyBlue
    }
    
    @IBAction func bgColorVeryLightGreen(_ sender: Any) {
        phraseView.backgroundColor = MyColor.veryLightGreen
    }
    
    @IBAction func bgColorWhite(_ sender: Any) {
        phraseView.backgroundColor = MyColor.white
    }
    
    
}

extension UIColor {
    class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
