//
//  FirstTankaViewController.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class FirstTankaViewController: UIViewController {

    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
