//
//  FirstTankaViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class FirstTankaViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.titleTextAttributes = [
            .foregroundColor: MyColor.brownishGrey
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController!.navigationBar.topItem?.title = "第一句を詠む"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNextView" {
            let nextView = segue.destination as! DetailTankaViewController
            nextView.argString = textView.text!
        }
    }
    
    @IBAction func tapToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
