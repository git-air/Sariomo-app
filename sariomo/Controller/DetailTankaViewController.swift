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
    
    var sectionId: Int = 5
    var iti: Int = 1
    var phrase: String = "Test"
    var user: Int = 15
    var date: String = "20191206"
    
    var backgroundColor = "FFFFFF"
    var textColor = "000000"
    
    @IBOutlet weak var phrase1Label: UILabel!
    @IBOutlet weak var phraseView: UIView!
    
    
    @IBOutlet weak var textColorPaletteView: UIView!
    @IBOutlet weak var backgroundColorPaletteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phrase1Label.text = argString
        phrase = argString
        
        textColorPaletteView.isHidden = true
        backgroundColorPaletteView.isHidden = true
        
        self.navigationController!.navigationBar.titleTextAttributes = [
            .foregroundColor: MyColor.brownishGrey
        ]
        
        navigationController!.navigationBar.topItem!.title = "戻る"

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostView" {
            postTanka()
//            let nextView = segue.destination as! BeaconViewController
//            nextView.sectionId = 1
//            nextView.iti = 1
//            nextView.phrase = argString
//            nextView.user = 5
//            nextView.date = "20191206"
//            nextView.background = backgroundColor
//            nextView.wordcolor = textColor
            
        }
    }
    
    func postTanka() {
        print("postTanka")
        let parameter: [String: Any] = [
            "sectionid": sectionId,
            "where": iti,
            "phrase": phrase,
            "user": user,
            "date": date,
            "background": backgroundColor,
            "wordcolor": textColor
        ]
        let api = ApiManager(host: "***REMOVED***", path: "/addPhrase", method: .post, parameters: parameter)
        api.request(success: {(data: Any) in
            print("data: \(data)")
        }, fail: {(error: Error?) in
            print(error!)
        })
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
        textColor = "000000"
        textColorPaletteView.isHidden = true
    }
    
    @IBAction func bgColorChangeFinished(_ sender: Any) {
        backgroundColorPaletteView.isHidden = true
    }
    
    @IBAction func bgColorChangeCancel(_ sender: Any) {
        phraseView.backgroundColor = MyColor.white
        backgroundColor = "FFFFFF"
        backgroundColorPaletteView.isHidden = true
    }
    
    
    
    @IBAction func textColorChange0(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 1.0)
        textColor = "000000"
    }
    
    @IBAction func textColorChange68(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 68, green: 68, blue: 68, alpha: 1.0)
        textColor = "444444"
    }
    
    @IBAction func textColorChange102(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 102, green: 102, blue: 102, alpha: 1.0)
        textColor = "666666"
    }
    
    @IBAction func textColorChange136(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 136, green: 136, blue: 136, alpha: 1.0)
        textColor = "888888"
    }
    
    @IBAction func textColorChange170(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 170, green: 170, blue: 170, alpha: 1.0)
        textColor = "AAAAAA"
    }
    
    @IBAction func textColorChange204(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 204, green: 204, blue: 204, alpha: 1.0)
        textColor = "CCCCCC"
    }
    
    @IBAction func textColorChange238(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 238, green: 238, blue: 238, alpha: 1.0)
        textColor = "EEEEEE"
    }
    
    @IBAction func textColorChange255(_ sender: Any) {
        phrase1Label.textColor = UIColor.rgba(red: 255, green: 255, blue: 255, alpha: 1.0)
        textColor = "FFFFFF"
    }
    
    @IBAction func bgColorPaleSalmon(_ sender: Any) {
        phraseView.backgroundColor = MyColor.paleSalmon
        backgroundColor = "FFAEAE"
    }
    
    @IBAction func bgColorPaleMauve(_ sender: Any) {
        phraseView.backgroundColor = MyColor.paleMauve
        backgroundColor = "FFE0FF"
    }
    
    @IBAction func bgColorPaleLilac(_ sender: Any) {
        phraseView.backgroundColor = MyColor.paleLilac
        backgroundColor = "DEDCFF"
    }
    
    @IBAction func bgColorGreyishBrown(_ sender: Any) {
        phraseView.backgroundColor = MyColor.greyishBrown
        backgroundColor = "3D3D3D"
    }
    
    @IBAction func bgColorCream(_ sender: Any) {
        phraseView.backgroundColor = MyColor.cream
        backgroundColor = "FFFFC6"
    }
    
    @IBAction func bgColorLightSkyBlue(_ sender: Any) {
        phraseView.backgroundColor = MyColor.lightSkyBlue
        backgroundColor = "C9F6FF"
    }
    
    @IBAction func bgColorVeryLightGreen(_ sender: Any) {
        phraseView.backgroundColor = MyColor.veryLightGreen
        backgroundColor = "DFFFCA"
    }
    
    @IBAction func bgColorWhite(_ sender: Any) {
        phraseView.backgroundColor = MyColor.white
        backgroundColor = "FFFFFF"
    }
    
}

extension UIColor {
    class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
