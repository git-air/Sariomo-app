//
//  DetectionBeaconView.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/12/02.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

class DetectionBeaconView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var animationBool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
        }
    }
    
    func doAnimation() {
        if animationBool {
            roundViewAnimation(delay: 0)
            roundViewAnimation(delay: 1)
            roundViewAnimation(delay: 2)
        }
    }
    
    func roundViewAnimation(delay: Double) {
        let roundView = createRoundView()
        UIView.animate(withDuration: 3, delay: delay, options: .curveEaseOut,
                       animations: {
                        roundView.alpha = 0
                        roundView.bounds.size = CGSize(width: self.view.bounds.width,
                                                       height: self.view.bounds.width)
                        roundView.layer.cornerRadius = roundView.bounds.width / 2
                        roundView.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
        }, completion: { _ -> Void in
            if delay == 2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.doAnimation()
                }
            }
        })
    }
    
    func createRoundView() -> UIView {
        let roundView = UIView()
        roundView.bounds.size = CGSize(width: 1, height: 1)
        roundView.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
        roundView.backgroundColor = UIColor(red: 0, green: 0.455, blue: 0.756, alpha: 0.8)
        roundView.layer.cornerRadius = roundView.bounds.width / 2
        roundView.layer.masksToBounds = true
        self.view.addSubview(roundView)
        self.view.bringSubviewToFront(self.iconImageView)
        return roundView
    }
}
