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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phrase1Label.text = argString
        
        textColorPaletteView.isHidden = true
        backgroundColorPaletteView.isHidden = true
        
        self.navigationController!.navigationBar.titleTextAttributes = [
            .foregroundColor: MyColor.brownishGrey
        ]
        
        navigationController!.navigationBar.topItem!.title = "戻る"

    }
    
    @IBAction func tapToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
