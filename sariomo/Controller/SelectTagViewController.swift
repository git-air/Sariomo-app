//
//  SelectTagViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/12/04.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class SelectTagViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    let checkedImage = UIImage(named: "check_on")!
    let uncheckedImage = UIImage(named: "check_off")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setImage(uncheckedImage, for: .normal)
        // button.setImage(checkedImage, for: .selected)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishDidTap(_ sender: Any) {
        // まずは親の(後ろの)タブバーのインスタンスを取得
        if let tabvc = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController  {
            //左から0番目のタブアイコンを選択状態にする(0が一番左)
            DispatchQueue.main.async {
                tabvc.selectedIndex = 0
            }
        }

        //移動先ViewControllerのインスタンスを取得（storyboard id: MainTabBarController）
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let toTop = storyboard.instantiateViewController(withIdentifier: "toHome")
        // self.tabBarController?.popt(animated: true)

        //遷移実行したら投稿画面を閉じる
        // self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        button.isSelected = !sender.isSelected
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
