//
//  TabBarViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/10/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self

        UITabBar.appearance().tintColor = MyColor.tomato
    }

}

// MARK: - UITabBarControllerDelegateに適合
extension TabBarViewController: UITabBarControllerDelegate {
    // TabBarItemが選択された時に呼ばれる
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        // TabBarItemタップでModal表示をする画面を指定して実装
        if viewController.children.first is FirstTankaViewController {
            if let newVC = UIStoryboard(name: "Tanka", bundle: nil).instantiateInitialViewController() {
                tabBarController.present(newVC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
}
