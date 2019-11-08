//
//  HomeViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/10/30.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        typealias BarType = TMBarView<TMHorizontalBarLayout, TMLabelBarButton, TMBarIndicator.None>
        
        // Create bar
        let bar = TMBar.ButtonBar()
        
        bar.layout.contentMode = .fit
        
        // Zeplinバージョン
        // bar.layout.alignment = .center
        
        bar.layout.separatorColor = MyColor.tomato
        bar.indicator.tintColor = MyColor.tomato
        
        
        bar.buttons.customize { (button) in
            button.selectedTintColor = MyColor.tomato
            button.tintColor = .darkGray
        }
        
        bar.backgroundView.style = .flat(color: .white)
        

        // Add to view
        addBar(bar, dataSource: self, at: .top)
        
    }
    
    private lazy var viewControllers: [UIViewController] = [
           storyboard!.instantiateViewController(withIdentifier: "follow"),
           storyboard!.instantiateViewController(withIdentifier: "unfinished"),
           storyboard!.instantiateViewController(withIdentifier: "finished")
       ]
    
}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title: [String] = ["フォロー", "未完成短歌", "完成短歌"]
        return TMBarItem(title: title[index])
    }
    
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
